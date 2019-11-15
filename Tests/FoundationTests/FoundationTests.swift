import XCTest
@testable import Foundation

final class FoundationTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Foundation().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
