import Foundation

extension Logger: LoggerProtocol {
    public func log(type: LogType, name: String, description: String? = nil, parameters: [String:Any]? = nil,
             file: String = #file, function: String = #function, line: Int = #line) {
        if let fileNameSubstring = file.split(separator: "/").last {
            let fileName = String(fileNameSubstring)
            let source = LogSource(file: fileName, function: function, line: line)
            let log = Log(type: type, source: source, name: name, description: description, parameters: parameters)
            for logger in loggers {
                logger.log(log)
            }
        }
    }

    public func registerServices(_ loggerServices: LoggerServiceType...) {
        for type in loggerServices {
            let isLoggerAlreadyRegistered = loggers.contains(where: { logger in
                return logger.type == type
            })
            if !isLoggerAlreadyRegistered {
                loggers.append(type.instantiateService())
            }
        }
    }

    public func unregisterServices(_ loggerServices: LoggerServiceType...) {
        for type in loggerServices {
            loggers.removeAll(where: { logger in
                return logger.type == type
            })
        }
    }
}
