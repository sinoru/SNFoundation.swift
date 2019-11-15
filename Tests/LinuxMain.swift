import XCTest

import SNFoundationTests
import UnknownableTests

var tests = [XCTestCaseEntry]()
tests += SNFoundationTests.allTests()
tests += UnknownableTests.allTests()
XCTMain(tests)
