//
//  RegisterBasedVirtualMachine.swift
//  
//
//  Created by Martônio Júnior on 12/10/23.
//

import Foundation

public struct RegisterBasedVirtualMachine<Key: Hashable, Value> {
    typealias Instruction = (Self) -> Void

    // MARK: Variables
    var state: [Key: Value] = [:]

    // MARK: Initializers
    public init(_ state: [Key: Value] = [:]) {
        self.state = state
    }

    // MARK: Methods
    subscript(key: Key) -> Value? {
        get { state[key] }
        set { state[key] = newValue }
    }

    public mutating func clear(_ key: Key) {
        state.removeValue(forKey: key)
    }
}

// MARK: Equatable
extension RegisterBasedVirtualMachine: Equatable where Value: Equatable {}

// MARK: ExpressibleByDictionaryLiteral
extension RegisterBasedVirtualMachine: ExpressibleByDictionaryLiteral {
    public init(dictionaryLiteral elements: (Key, Value)...) {
        for (key, value) in elements {
            self.state[key] = value
        }
    }
}

// MARK: Sendable
extension RegisterBasedVirtualMachine: Sendable where Key: Sendable, Value: Sendable {}
