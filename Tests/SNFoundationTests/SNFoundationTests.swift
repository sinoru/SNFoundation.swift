import XCTest
@testable import SNFoundation

final class SNFoundationTests: XCTestCase {
    func testExpressional() {
        enum A: CustomExpressional {
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

    #if swift(>=5.1)
    func testWeak() {
        XCTAssertNotNil(Weak<AnyObject>.self)
    }

    func testPurgable() {
        XCTAssertNotNil(Purgeable<Any>.self)
    }
    #endif

    static var allTests = [
        ("testExpressional", testExpressional),
        ("testUnknownable", testUnknownable),
        ("testWeak", testWeak),
    ]
}
