//
//  WeakTests.swift
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
@testable import Weak

final class WeakTests: XCTestCase {
    func testWeak() {
        class A {

        }

        var a: A? = A()
        XCTAssertNotNil(a)

        let wrappedA = Weak(a)
        XCTAssertNotNil(wrappedA.object)

        a = nil
        XCTAssertNil(wrappedA.object)
    }

    static var allTests = [
        ("testWeak", testWeak),
    ]
}
