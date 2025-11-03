//
//  RegisterBasedVirtualMachineTests.swift
//  Core
//
//  Created by Martônio Júnior on 11/03/2025.
//

import Testing
@testable import Bytecode

struct RegisterBasedVirtualMachineTests {
    typealias Mock = MockRegister

    @Test("Sets a value in the register", arguments: [
        (Mock(dictionaryLiteral: ("key", 5)), ("blue", 9), Mock(dictionaryLiteral: ("key", 5), ("blue", 9))),
        (Mock(dictionaryLiteral: ("key", 5)), ("key", 9), Mock(dictionaryLiteral: ("key", 9))),
        (Mock(), ("abc", 4), Mock(dictionaryLiteral: ("abc", 4))),
        (Mock(dictionaryLiteral: ("abc", 5)), ("abc", nil), Mock())
    ])
    func set(_ register: MockRegister, pair: (String, Int?), expected: MockRegister) async throws {
        var register = register
        register[pair.0] = pair.1
        #expect(register == expected)
    }

    @Test("Gets a value from the register", arguments: [
        (Mock(dictionaryLiteral: ("key", 5)), "key", 5),
        (Mock(dictionaryLiteral: ("goal", 9)), "blue", nil)
    ])
    func get(_ register: Mock, key: String, expected: Int?) async throws {
        let value = register[key]
        #expect(value == expected)
    }

    @Test("Clears a value in the registry", arguments: [
        (Mock(dictionaryLiteral: ("key", 5)), "key", Mock()),
        (Mock(dictionaryLiteral: ("key", 5), ("blue", 9)), "key", Mock(dictionaryLiteral: ("blue", 9))),
        (Mock(dictionaryLiteral: ("key", 5), ("blue", 9)), "yellow", Mock(dictionaryLiteral: ("key", 5), ("blue", 9)))
    ])
    func clear(_ register: Mock, key: String, expected: Mock) async throws {
        var register = register
        register.clear(key)
        #expect(register == expected)
    }
}
