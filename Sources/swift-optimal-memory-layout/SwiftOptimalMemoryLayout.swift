//
//  SwiftOptimalMemoryLayout.swift
//
//
//  Created by Evan Anderson on 1/18/25.
//

@_exported import Utilities

@attached(member, names: arbitrary)
public macro declare(
    defaultVisibility: VariableVisibility = .internal,
    _ variables: [OptimalMemoryLayoutVariable]
) = #externalMacro(module: "SwiftOptimalMemoryLayoutMacro", type: "Declare")

/// Internal declaration.
@attached(member, names: arbitrary)
public macro _declare(
    defaultVisibility: VariableVisibility = .internal,
    _ variables: [OptimalMemoryLayoutVariable]
) = #externalMacro(module: "SwiftOptimalMemoryLayoutMacro", type: "_Declare")