//
//  UnknownableTests.swift
//  
//
//  Created by Jaehong Kang on 2019/11/15.
//  Copyright © 2019 Sinoru. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

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
