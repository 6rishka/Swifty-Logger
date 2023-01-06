import Foundation

protocol LoggerServiceProtocol {
    var type: LoggerServiceType { get }
    func log(_ log: Log)
}
