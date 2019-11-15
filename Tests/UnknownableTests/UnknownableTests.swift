//
//  UnknownableTests.swift
//  
//
//  Created by Jaehong Kang on 2019/11/15.
//

import Foundation


import XCTest
@testable import SNFoundation

final class UnknownableTests: XCTestCase {
    func testRawRepresentable() {
        enum A: String {
            case a, b, c, d
        }

        let knownA = Unknownable<A>.known(A.a)
        let unknownA = Unknownable<A>.unknown("a")

        XCTAssertTrue(knownA.rawValue == unknownA.rawValue)
    }

    func testExpressional() {
        enum A: String {
            case a, b, c, d
        }

        let knownB = Unknownable<A>.known(A.b)
        let unknownB = Unknownable<A>.unknown("b")

        XCTAssertTrue(knownB ~= unknownB)
    }

    static var allTests = [
        ("testExpressional", testExpressional),
    ]
}
