//
//  FirebaseAnalyticsLogger+parameters.swift
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
    func add(logType: LogType, to parameters: [String: Any]?) -> [String: Any]? {
        var parametersWithLogType: [String: Any]
        if parameters == nil {
            parametersWithLogType = [:]
            parametersWithLogType["i__type"] = logType.getName()
        } else {
            parametersWithLogType = parameters!
            parametersWithLogType["i__type"] = logType.getName()
        }
        return parametersWithLogType
    }
    
    func add(description: String?, to parameters: [String: Any]?) -> [String: Any]? {
        var parametersWithDescription: [String : Any]
        if parameters == nil {
            if description == nil {
                return nil
            } else {
                parametersWithDescription = [:]
                parametersWithDescription["i__description"] = description
            }
        } else {
            parametersWithDescription = parameters!
            if description != nil {
                parametersWithDescription["i__description"] = description
            }
        }
        return parametersWithDescription
    }
    
    func add(source: LogSource, to parameters: [String: Any]?) -> [String: Any] {
        var parametersWithSource: [String : Any]
        if parameters == nil {
            parametersWithSource = [:]
            parametersWithSource["i__file"] = source.file
            parametersWithSource["i__function"] = source.function
            parametersWithSource["i__line"] = source.line
        } else {
            parametersWithSource = parameters!
            parametersWithSource["i__file"] = source.file
            parametersWithSource["i__function"] = source.function
            parametersWithSource["i__line"] = source.line
        }
        return parametersWithSource
    }
}
