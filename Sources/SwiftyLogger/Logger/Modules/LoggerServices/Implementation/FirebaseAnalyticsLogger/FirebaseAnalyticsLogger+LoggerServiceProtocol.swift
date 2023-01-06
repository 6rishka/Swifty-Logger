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
