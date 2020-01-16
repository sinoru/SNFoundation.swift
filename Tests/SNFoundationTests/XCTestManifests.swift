import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SNFoundationTests.allTests),
        testCase(NotificationCenterTests.allTests),
        testCase(LazyTests.allTests),
        testCase(UnknownableTests.allTests),
        testCase(WeakTests.allTests),
    ]
}
#endif
