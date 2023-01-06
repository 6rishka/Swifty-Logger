import Foundation

extension LogType {
    func getName() -> String {
        switch self {
        case .info:
            return "Information"
        case .warning:
            return "Warning"
        case .error:
            return "Error"
        }
    }
}
