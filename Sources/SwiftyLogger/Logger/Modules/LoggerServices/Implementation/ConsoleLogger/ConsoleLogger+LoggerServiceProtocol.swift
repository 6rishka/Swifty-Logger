import Foundation

extension ConsoleLogger: LoggerServiceProtocol {
    var type: LoggerServiceType {
        return .consoleLogger
    }
    
    func log(_ log: Log) {
        print("------------------------------------------------------------------------------------")
        switch log.type {
        case .info:
            print("📢 \(log.type.getName()) - \(log.name)")
        case .warning:
            print("⚠️ \(log.type.getName()) - \(log.name)")
        case .error:
            print("❗️ \(log.type.getName()) - \(log.name)")
            
        }
        if log.description != nil || log.parameters != nil {
            print("🔖 Details")
        }
        if let description = log.description {
            print("     🖋 Description: " + description)
        }
        if let parameters = log.parameters {
            print("     📎 Parameters: " + parameters.description)
        }
        print("🔎 Source")
        print("     🗂 File - \(log.source.file)")
        print("     🔨 Function - \(log.source.function)")
        print("     📏 Line - \(log.source.line)")
    }
}
