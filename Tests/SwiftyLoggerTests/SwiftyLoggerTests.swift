import XCTest
@testable import SwiftyLogger

final class SwiftyLoggerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let logger = Logger.shared
        logger.registerServices(.consoleLogger, .firebaseAnalyticsLogger)
        logger.log(type: .info, name: "testLog", description: "Test log example", parameters: ["SwiftyLoggerVersion": 1.0])
    }
}
