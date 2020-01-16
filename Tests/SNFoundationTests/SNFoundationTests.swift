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

    func testWeak() {
        XCTAssertNotNil(Weak<AnyObject>.self)
    }

    func testPurgable() {
        XCTAssertNotNil(Purgeable<Any>.self)
    }

    static var allTests: [(String, (SNFoundationTests) -> () -> ())] = {
        var allTests = [
            ("testExpressional", testExpressional),
            ("testUnknownable", testUnknownable),
        ]

        allTests += [
            ("testWeak", testWeak),
            ("testPurgable", testPurgable),
        ]

        return allTests
    }()
}
