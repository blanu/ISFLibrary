/*
    VersionRepresentable.swift

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

import Foundation

public protocol VersionRepresentable: RawRepresentable, Comparable, CustomStringConvertible { }

extension VersionRepresentable {
    internal func getVersion(from string: String) -> Array<UInt>? {
        let version = string.components(separatedBy: CharacterSet(charactersIn: "."))

        guard (version.count == 3 && version[0].isPositiveInteger && version[1].isPositiveInteger && version[2].isPositiveInteger) else {
            return nil
        }

        return Array<UInt>(arrayLiteral: UInt(version[0])!, UInt(version[1])!, UInt(version[2])!)
    }
}

// implementation of CustomStringConvertible
extension VersionRepresentable {
    public var description: String {
        return rawValue as! String
    }
}
