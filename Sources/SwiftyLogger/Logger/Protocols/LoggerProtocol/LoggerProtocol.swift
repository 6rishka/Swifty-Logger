import Foundation

public protocol LoggerProtocol {
    func log(type: LogType, name: String, description: String?, parameters: [String:Any]?, file: String, function: String, line: Int)
    func registerServices(_ loggerServices: LoggerServiceType...)
    func unregisterServices(_ loggerServices: LoggerServiceType...)
}
