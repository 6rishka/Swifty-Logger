import Foundation

public extension LoggerProtocol {
    func log(type: LogType, name: String) {
        log(type: type, name: name, description: nil, parameters: nil, file: #file, function: #function, line: #line)
    }

    func log(type: LogType, name: String, description: String?) {
        log(type: type, name: name, description: description, parameters: nil, file: #file, function: #function, line: #line)
    }

    func log(type: LogType, name: String, description: String?, parameters: [String: Any]?) {
        log(type: type, name: name, description: description, parameters: parameters, file: #file, function: #function, line: #line)
    }

    func log(type: LogType, name: String, parameters: [String: Any]?) {
        log(type: type, name: name, description: nil, parameters: parameters, file: #file, function: #function, line: #line)
    }
}
