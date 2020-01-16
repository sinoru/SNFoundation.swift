//
//  AsynchronousOperationTests.swift
//  
//
//  Created by Jaehong Kang on 2020/01/16.
//

import XCTest
@testable import SNFoundation

final class AsynchronousOperationTests: XCTestCase {
    func testOperationIntial() {
        let operation = SNFoundation.AsynchronousOperation<Void, Swift.Error>()
        XCTAssertEqual(operation.isReady, false)
        XCTAssertEqual(operation.isExecuting, false)
        XCTAssertEqual(operation.isCancelled, false)
        XCTAssertEqual(operation.isFinished, false)

        wait(for: [
            XCTKVOExpectation(keyPath: "isReady", object: operation, expectedValue: false),
            XCTKVOExpectation(keyPath: "isExecuting", object: operation, expectedValue: false),
            XCTKVOExpectation(keyPath: "isCancelled", object: operation, expectedValue: false),
            XCTKVOExpectation(keyPath: "isFinished", object: operation, expectedValue: false)
        ], timeout: 1.0)
    }

    func testOperationReady() {
        let operation = SNFoundation.AsynchronousOperation<Void, Swift.Error>()
        XCTAssertEqual(operation.isReady, false)
        XCTAssertEqual(operation.isExecuting, false)
        XCTAssertEqual(operation.isCancelled, false)
        XCTAssertEqual(operation.isFinished, false)

        let expectations = [
            XCTKVOExpectation(keyPath: "isReady", object: operation, expectedValue: true),
            XCTKVOExpectation(keyPath: "isExecuting", object: operation, expectedValue: false),
            XCTKVOExpectation(keyPath: "isCancelled", object: operation, expectedValue: false),
            XCTKVOExpectation(keyPath: "isFinished", object: operation, expectedValue: false)
        ]

        operation.state = .ready
        XCTAssertEqual(operation.isReady, true)
        XCTAssertEqual(operation.isExecuting, false)
        XCTAssertEqual(operation.isCancelled, false)
        XCTAssertEqual(operation.isFinished, false)

        wait(for: expectations, timeout: 1.0)
    }

    func testOperationExecuting() {
        let operation = SNFoundation.AsynchronousOperation<Void, Swift.Error>()
        XCTAssertEqual(operation.isReady, false)
        XCTAssertEqual(operation.isExecuting, false)
        XCTAssertEqual(operation.isCancelled, false)
        XCTAssertEqual(operation.isFinished, false)

        let expectations = [
            XCTKVOExpectation(keyPath: "isReady", object: operation, expectedValue: false),
            XCTKVOExpectation(keyPath: "isExecuting", object: operation, expectedValue: true),
            XCTKVOExpectation(keyPath: "isCancelled", object: operation, expectedValue: false),
            XCTKVOExpectation(keyPath: "isFinished", object: operation, expectedValue: false)
        ]

        operation.state = .executing
        XCTAssertEqual(operation.isReady, false)
        XCTAssertEqual(operation.isExecuting, true)
        XCTAssertEqual(operation.isCancelled, false)
        XCTAssertEqual(operation.isFinished, false)

        wait(for: expectations, timeout: 1.0)
    }

    func testOperationFinished() {
        let operation = SNFoundation.AsynchronousOperation<Void, Swift.Error>()
        XCTAssertEqual(operation.isReady, false)
        XCTAssertEqual(operation.isExecuting, false)
        XCTAssertEqual(operation.isCancelled, false)
        XCTAssertEqual(operation.isFinished, false)

        let expectations = [
            XCTKVOExpectation(keyPath: "isReady", object: operation, expectedValue: false),
            XCTKVOExpectation(keyPath: "isExecuting", object: operation, expectedValue: false),
            XCTKVOExpectation(keyPath: "isCancelled", object: operation, expectedValue: false),
            XCTKVOExpectation(keyPath: "isFinished", object: operation, expectedValue: true)
        ]

        operation.state = .finished(.success(()))
        XCTAssertEqual(operation.isReady, false)
        XCTAssertEqual(operation.isExecuting, false)
        XCTAssertEqual(operation.isCancelled, false)
        XCTAssertEqual(operation.isFinished, true)

        wait(for: expectations, timeout: 1.0)
    }

    func testOperationCancelled() {
        let operation = SNFoundation.AsynchronousOperation<Void, Swift.Error>()
        XCTAssertEqual(operation.isReady, false)
        XCTAssertEqual(operation.isExecuting, false)
        XCTAssertEqual(operation.isCancelled, false)
        XCTAssertEqual(operation.isFinished, false)

        let expectations = [
            XCTKVOExpectation(keyPath: "isReady", object: operation, expectedValue: false),
            XCTKVOExpectation(keyPath: "isExecuting", object: operation, expectedValue: false),
            XCTKVOExpectation(keyPath: "isCancelled", object: operation, expectedValue: true),
            XCTKVOExpectation(keyPath: "isFinished", object: operation, expectedValue: false)
        ]

        operation.state = .cancelled
        XCTAssertEqual(operation.isReady, false)
        XCTAssertEqual(operation.isExecuting, false)
        XCTAssertEqual(operation.isCancelled, true)
        XCTAssertEqual(operation.isFinished, false)

        wait(for: expectations, timeout: 1.0)
    }

    static var allTests = [
        ("testOperationIntial", testOperationIntial),
        ("testOperationReady", testOperationReady),
        ("testOperationExecuting", testOperationExecuting),
        ("testOperationFinished", testOperationFinished),
    ]
}
