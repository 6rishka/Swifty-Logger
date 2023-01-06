import Foundation

struct Log {
    let type: LogType
    let source: LogSource
    let name: String
    let description: String?
    let parameters: [String : Any]?
}
