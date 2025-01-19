//
//  SwiftOptimalMemoryLayoutTests.swift
//
//
//  Created by Evan Anderson on 1/18/25.
//

#if compiler(>=6.0)

import Testing
import swift_optimal_memory_layout

@Test func example() async throws {
    TestStruct()
}

@declare(
    defaultVisibility: .public,
    [
        .let(name: "simd", type: SIMD64<UInt8>.self),
        .let(name: "boolean", type: Bool.self, documentation: ["see if this", "", "works"]),
        .let(name: "string", type: String.self),
        .var(name: "integer", type: Int.self)
    ]
)
struct TestStruct {

    init() {
        simd = .init()
        boolean = false
        string = ""
        integer = 0
        print("\(MemoryLayout<Self>.alignment),\(MemoryLayout<Self>.size),\(MemoryLayout<Self>.stride)")
    }

    func doThing() {
    }
}


#endif