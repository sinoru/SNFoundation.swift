import XCTest
@testable import SNFoundation

final class SNFoundationTests: XCTestCase {
    func testExpressional() {
        enum A: Expressional {
            case a
        }

        XCTAssertNotNil(A.self)
    }

    func testUnknownable() {
        enum A: String {
            case a
        }

        XCTAssertNotNil(Unknownable<A>.self)
    }

    func testWeak() {
        XCTAssertNotNil(Weak<AnyObject>.self)
    }

    static var allTests = [
        ("testExpressional", testExpressional),
        ("testUnknownable", testUnknownable),
        ("testWeak", testWeak),
    ]
}
