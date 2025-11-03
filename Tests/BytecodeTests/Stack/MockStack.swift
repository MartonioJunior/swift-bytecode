//
//  MockStack.swift
//  Core
//
//  Created by Martônio Júnior on 11/03/2025.
//

import Bytecode

typealias MockStack = StackBasedVirtualMachine<MockValueStack>

// Simulates the set of elements in a Stack VM
enum MockValueStack {
    case instruction(String)
    case value(Int)
}

// MARK: Autoconformances
extension MockValueStack: Equatable {}
extension MockValueStack: Sendable {}
