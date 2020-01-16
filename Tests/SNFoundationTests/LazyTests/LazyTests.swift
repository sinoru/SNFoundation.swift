//
//  LazyTests.swift
//  
//
//  Created by Jaehong Kang on 2020/01/15.
//

import Foundation

import XCTest
@testable import SNFoundation

final class LazyTests: XCTestCase {

    func testLazy() {
        class Test {
            @Lazy var test = "test"
        }

        let test = Test()
        XCTAssertEqual(test.$test.isLoaded, false)
        XCTAssertNil(test.$test.wrappedValueIfLoaded)
        XCTAssertEqual(test.$test.isLoaded, false)

        _ = test.test

        XCTAssertEqual(test.$test.isLoaded, true)
        XCTAssertNotNil(test.$test.wrappedValueIfLoaded)
        XCTAssertEqual(test.$test.isLoaded, true)
    }

    static var allTests = [
        ("testLazy", testLazy),
    ]
}
