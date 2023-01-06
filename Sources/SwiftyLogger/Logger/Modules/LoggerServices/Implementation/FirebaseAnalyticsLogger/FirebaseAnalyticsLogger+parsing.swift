import Foundation

extension FirebaseAnalyticsLogger {
    func parse(name: String) -> String {
        let logArray = name.components(separatedBy: " ")
        var parsedName = ""
        for word in logArray {
            var first: String
            if parsedName.isEmpty {
                first = String(word.prefix(1)).lowercased()
            } else {
                first = String(word.prefix(1)).capitalized
            }
            let other = String(word.dropFirst())
            parsedName += first + other
        }
        parsedName = parsedName.components(separatedBy: CharacterSet.alphanumerics.inverted).joined(separator: "")
        if parsedName.count > maxNameLength {
            let numberOfCharactersToTrim = parsedName.count - maxNameLength
            parsedName = String(parsedName.dropLast(numberOfCharactersToTrim))
        }
        return parsedName
    }
    
    func parse(parameters: [String: Any]?) -> [String: Any]? {
        guard var parameters = parameters else { return nil }
        for (key, value) in parameters {
            var validKey: String
            var validValue: String
            if key.count > maxParameterKeyLength {
                parameters.removeValue(forKey: key)
                let numberOfCharactersToTrimKey = key.count - maxParameterKeyLength
                let trimmedKey = String(key.dropLast(numberOfCharactersToTrimKey))
                validKey = trimmedKey
            } else {
                validKey = key
            }
            let valueAsString = String(describing: value)
            if valueAsString.count > maxParameterValueLength {
                let numberOfCharactersToTrimValue = valueAsString.count - maxParameterValueLength
                let trimmedValue = String(valueAsString.dropLast(numberOfCharactersToTrimValue))
                validValue = trimmedValue
            } else {
                validValue = valueAsString
            }
            parameters[validKey] = validValue
        }
        return parameters
    }
}
