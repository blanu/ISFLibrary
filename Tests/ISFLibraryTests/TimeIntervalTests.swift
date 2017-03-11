/*
    QueueTests.swift

    Copyright (c) 2016, 2017 Stephen Whittle  All rights reserved.

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"),
    to deal in the Software without restriction, including without limitation
    the rights to use, copy, modify, merge, publish, distribute, sublicense,
    and/or sell copies of the Software, and to permit persons to whom
    the Software is furnished to do so, subject to the following conditions:
    The above copyright notice and this permission notice shall be included
    in all copies or substantial portions of the Software.
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
    THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
    FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
    IN THE SOFTWARE.
*/

import Foundation
import XCTest
@testable import ISFLibrary

class TimeIntervalTests: XCTestCase {
    func testTimeInterval() {
        var timeInterval = TimeInterval(seconds: 1)

        XCTAssertEqual(timeInterval.wholeSeconds, 1, "seconds to wholeSeconds")
        XCTAssertEqual(timeInterval.seconds, 1, "seconds to seconds")
        XCTAssertEqual(timeInterval.deciseconds, 10, "seconds to deciseconds")
        XCTAssertEqual(timeInterval.centiseconds, 100, "seconds to centiseconds")
        XCTAssertEqual(timeInterval.milliseconds, 1_000, "seconds to milliseconds")
        XCTAssertEqual(timeInterval.microseconds, 1_000_000, "seconds to microseconds")

        timeInterval = TimeInterval(deciseconds: 1)

        XCTAssertEqual(timeInterval.wholeSeconds, 0, "deciseconds to wholeSeconds")
        XCTAssertEqual(timeInterval.seconds, 0.1, "deciseconds to seconds")
        XCTAssertEqual(timeInterval.centiseconds, 10, "deciseconds to centiseconds")
        XCTAssertEqual(timeInterval.milliseconds, 100, "deciseconds to milliseconds")
        XCTAssertEqual(timeInterval.microseconds, 100_000, "deciseconds to microseconds")

        timeInterval = TimeInterval(centiseconds: 1)

        XCTAssertEqual(timeInterval.seconds, 0.01, "centiseconds to seconds")
        XCTAssertEqual(timeInterval.deciseconds, 0, "centiseconds to deciseconds")
        XCTAssertEqual(timeInterval.milliseconds, 10, "centiseconds to milliseconds")
        XCTAssertEqual(timeInterval.microseconds, 10_000, "centiseconds to microseconds")

        timeInterval = TimeInterval(milliseconds: 1)

        XCTAssertEqual(timeInterval.seconds, 0.001, "milliseconds to seconds")
        XCTAssertEqual(timeInterval.deciseconds, 0, "milliseconds to deciseconds")
        XCTAssertEqual(timeInterval.centiseconds, 0, "milliseconds to centiseconds")
        XCTAssertEqual(timeInterval.microseconds, 1_000, "milliseconds to microseconds")

        timeInterval = TimeInterval(microseconds: 1)

        XCTAssertEqual(timeInterval.seconds, 0.000001, "microseconds to seconds")
    }

#if !os(OSX)
    static let allTests = [
        ("testTimeInterval", testTimeInterval)
    ]
#endif
}