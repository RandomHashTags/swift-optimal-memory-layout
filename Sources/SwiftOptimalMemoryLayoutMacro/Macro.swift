//
//  Macro.swift
//
//
//  Created by Evan Anderson on 1/18/25.
//

import SwiftCompilerPlugin
import SwiftSyntaxMacros
import SwiftDiagnostics

@main
struct SwiftOptimalMemoryLayoutMacro : CompilerPlugin {
    let providingMacros:[any Macro.Type] = [
        Declare.self
    ]
}