//
//  NotificationCenterTests.swift
//  
//
//  Created by Jaehong Kang on 2019/11/16.
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

final class NotificationCenterTests: XCTestCase {
    func testNotified() {
        class A: NSObject {

        }
        let a = A()

        let notificationName = Notification.Name(rawValue: "TEST")

        let observationExpectaion = expectation(description: "Wait for notify")
        let observation = NotificationCenter.default.observe(forName: notificationName, object: a, queue: nil) { (_) in
            observationExpectaion.fulfill()
        }

        NotificationCenter.default.post(name: notificationName, object: a)

        wait(for: [observationExpectaion], timeout: 1.0)
        XCTAssertNotNil(observation)
    }

    func testNotNotifiedAfterObservationDealloc() {
        class A: NSObject {

        }
        let a = A()

        let notificationName = Notification.Name(rawValue: "TEST")

        let observationExpectaion = expectation(description: "Wait for NOT notify")
        observationExpectaion.isInverted = true

        var observation: NotificationCenter.Observation? = NotificationCenter.default.observe(forName: notificationName, object: a, queue: nil) { (_) in
            observationExpectaion.fulfill()
        }

        observation = nil

        NotificationCenter.default.post(name: notificationName, object: a)
        wait(for: [observationExpectaion], timeout: 1.0)
        XCTAssertNil(observation)
    }

    static var allTests = [
        ("testNotified", testNotified),
        ("testNotNotifiedAfterObservationDealloc", testNotNotifiedAfterObservationDealloc),
    ]
}
