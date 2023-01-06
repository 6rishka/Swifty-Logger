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
