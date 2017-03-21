/*
    LoggerResult.swift

    Copyright (c) 2017 Stephen Whittle  All rights reserved.

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

public struct LoggerResult {
    public let message: String
    public let level: LoggerLevel
    public let file: String
    public let line: Int
    public let column: Int
    public let function: String
    public let objects: Array<Any>

    public init(level:    LoggerLevel,
                message:  String,
                file:     String = #file,
                line:     Int = #line,
                column:   Int = #column,
                function: String = #function,
                objects:  Array<Any> = []) {
        self.message = message
        self.level = level
        self.file = file
        self.line = line
        self.column = column
        self.function = function
        self.objects = objects
    }
}

extension LoggerResult: CustomStringConvertible {
    public var description: String {
        var description = "message: \(message), level: \(level), file: \(file), line: \(line), column: \(column), function: \(function)"

        if (objects.count > 0) {
            description += ", objects: ("

            var loopCount = 0

            for object in objects {
                if (loopCount > 0) {
                    description += ", "
                }

                description += "[\(object)]"

                loopCount += 1
            }

            description += ")"
        }

        return description
    }
}
