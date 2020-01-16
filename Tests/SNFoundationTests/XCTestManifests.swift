import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(NotificationCenterTests.allTests),
        testCase(LazyTests.allTests),
        testCase(UnknownableTests.allTests),
        testCase(WeakTests.allTests),
        testCase(AsynchronousOperationTests.allTests),
    ]
}
#endif
