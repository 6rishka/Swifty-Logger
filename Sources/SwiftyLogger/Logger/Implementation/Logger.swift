public class Logger {
    var loggers: [LoggerServiceProtocol] = []
    
    public init() {
        self.loggers = [ConsoleLogger()]
    }
}
