//
//  StackBasedVirtualMachineTests.swift
//  Core
//
//  Created by Martônio Júnior on 11/03/2025.
//

import Testing
@testable import Bytecode

struct StackBasedVirtualMachineTests {
    typealias Mock = StackBasedVirtualMachine<MockValueStack>

    @Test("Places a value on the top of stack", arguments: [
        (Mock(), MockValueStack.value(22), Mock(arrayLiteral: MockValueStack.value(22))),
        (Mock(arrayLiteral: .instruction("goal"), .value(22)), MockValueStack.instruction("move"), Mock(arrayLiteral: .instruction("goal"), .value(22), .instruction("move")))
    ])
    func push(stack: Mock, _ value: MockValueStack, expected: Mock) async throws {
        var stack = stack
        stack.push(value)
        #expect(stack == expected)
    }

    @Test("Removes a value from the top of stack", arguments: [
        (Mock(arrayLiteral: .instruction("goal"), .value(22)), MockValueStack.value(22), Mock(arrayLiteral: .instruction("goal"))),
        (Mock(), nil, Mock())
    ])
    func pop(stack: Mock, _ expected: MockValueStack?, updatedStack: Mock) async throws {
        var stack = stack
        let result = stack.pop()
        #expect(result == expected)
        #expect(stack == updatedStack)
    }
}
