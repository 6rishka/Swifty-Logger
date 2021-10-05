//
//  FirebaseAnalyticsLogger+parsing.swift
//  SwiftyLogger
//
//  Created by Greg Charyszczak on 13/09/2021.
//  Copyright © 2021 Greg Charyszczak. All rights reserved.
//
//    The MIT License (MIT)
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.

import Foundation

extension FirebaseAnalyticsLogger {
    func parse(name: String) -> String {
        let logArray = name.components(separatedBy: " ")
        var parsedName = ""
        for word in logArray {
            var first: String
            if parsedName.isEmpty {
                first = String(word.prefix(1)).lowercased()
            } else {
                first = String(word.prefix(1)).capitalized
            }
            let other = String(word.dropFirst())
            parsedName += first + other
        }
        parsedName = parsedName.components(separatedBy: CharacterSet.alphanumerics.inverted).joined(separator: "")
        if parsedName.count > maxNameLength {
            let numberOfCharactersToTrim = parsedName.count - maxNameLength
            parsedName = String(parsedName.dropLast(numberOfCharactersToTrim))
        }
        return parsedName
    }
    
    func parse(parameters: [String: Any]?) -> [String: Any]? {
        guard var parameters = parameters else { return nil }
        for (key, value) in parameters {
            var validKey: String
            var validValue: String
            if key.count > maxParameterKeyLength {
                parameters.removeValue(forKey: key)
                let numberOfCharactersToTrimKey = key.count - maxParameterKeyLength
                let trimmedKey = String(key.dropLast(numberOfCharactersToTrimKey))
                validKey = trimmedKey
            } else {
                validKey = key
            }
            let valueAsString = String(describing: value)
            if valueAsString.count > maxParameterValueLength {
                let numberOfCharactersToTrimValue = valueAsString.count - maxParameterValueLength
                let trimmedValue = String(valueAsString.dropLast(numberOfCharactersToTrimValue))
                validValue = trimmedValue
            } else {
                validValue = valueAsString
            }
            parameters[validKey] = validValue
        }
        return parameters
    }
}
