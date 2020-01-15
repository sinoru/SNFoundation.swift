//
//  LazyTests.swift
//  
//
//  Created by Jaehong Kang on 2020/01/15.
//

import Foundation

import XCTest
@testable import Lazy

final class LazyTests: XCTestCase {

    @Lazy var testLazy_test = "test"
    func testLazy() {
        XCTAssertEqual(_testLazy_test.isLoaded, false)
        XCTAssertNil(_testLazy_test.valueIfLoaded)
        XCTAssertEqual(_testLazy_test.isLoaded, false)

        _ = testLazy_test

        XCTAssertEqual(_testLazy_test.isLoaded, true)
        XCTAssertNotNil(_testLazy_test.valueIfLoaded)
        XCTAssertEqual(_testLazy_test.isLoaded, true)
    }

    static var allTests = [
        ("testLazy", testLazy),
    ]
}
