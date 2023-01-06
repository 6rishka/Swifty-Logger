import Foundation

extension LoggerServiceType {
    func instantiateService() -> LoggerServiceProtocol {
        switch self {
        case .firebaseAnalyticsLogger:
            return FirebaseAnalyticsLogger()
        case .consoleLogger:
            return ConsoleLogger()
        }
    }
}
