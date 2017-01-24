/*
    Queue.swift

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

/*
    First-in first-out queue (FIFO)

    New elements are added to the end of the queue. Poping pulls elements from
    the front of the queue.

    pushing and poping are O(1) operations.
*/
public struct Queue<T> {
    private var elements = [T?]()
    private var head = 0

    public var isEmpty: Bool {
        return (self.count == 0)
    }

    public var count: Int {
        return self.elements.count - self.head
    }

    public mutating func push(_ element: T) {
        self.elements.append(element)
    }

    public mutating func pop() -> T? {
        guard self.head < self.elements.count, let element = self.elements[self.head] else {
            return nil
        }

        self.elements[self.head] = nil
        self.head += 1

        let percentage = Double(self.head) / Double(self.elements.count)

        if (self.elements.count > 50 && percentage > 0.25) {
            self.elements.removeFirst(self.head)
            self.head = 0
        }

        return element
    }

    public func peek() -> T? {
        return (self.isEmpty) ? nil : self.elements[self.head]
    }
}
