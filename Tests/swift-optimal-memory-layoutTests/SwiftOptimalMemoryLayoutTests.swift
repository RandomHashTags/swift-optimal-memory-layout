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
        //.let(name: "simd", type: .simd64UInt8),
        .let(name: "boolean", type: .bool, documentation: ["see if this", "", "works"]),
        .let(name: "string", type: .string),
        .var(name: "integer", type: .int)
    ]
)
struct TestStruct {

    init() {
        //simd = .init()
        boolean = false
        string = ""
        integer = 0
        print("\(MemoryLayout<Self>.alignment),\(MemoryLayout<Self>.size),\(MemoryLayout<Self>.stride)")
    }

    func doThing() {
    }
}


#endif