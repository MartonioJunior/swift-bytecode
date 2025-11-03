//
//  StackBasedVirtualMachine.swift
//  
//
//  Created by Martônio Júnior on 12/10/23.
//

import Foundation

public struct StackBasedVirtualMachine<Value> {
    typealias Instruction = (Self) -> Void

    // MARK: Variables
    var stack: [Value]

    // MARK: Initializers
    public init(stack: [Value] = []) {
        self.stack = stack
    }

    // MARK: Methods
    public mutating func push(_ value: Value) {
        stack.append(value)
    }

    public mutating func pop() -> Value? {
        stack.popLast()
    }
}

// MARK: Equatable
extension StackBasedVirtualMachine: Equatable where Value: Equatable {}

// MARK: ExpressibleByArrayLiteral
extension StackBasedVirtualMachine: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Value...) {
        self.stack = elements
    }
}

// MARK: Sendable
extension StackBasedVirtualMachine: Sendable where Value: Sendable {}
