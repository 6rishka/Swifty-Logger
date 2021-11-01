//
//  FirebaseAnalyticsLogger+LoggerServiceProtocol.swift
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
import FirebaseAnalytics

extension FirebaseAnalyticsLogger: LoggerServiceProtocol {
    var type: LoggerServiceType {
        return .firebaseAnalyticsLogger
    }
    
    func log(_ log: Log) {
        let parsedName = parse(name: log.name)
        var parameters = add(logType: log.type, to: log.parameters)
        parameters = add(description: log.description, to: log.parameters)
        parameters = add(source: log.source, to: parameters)
        parameters = parse(parameters: parameters)
        Analytics.logEvent(parsedName, parameters: parameters)
    }
}
