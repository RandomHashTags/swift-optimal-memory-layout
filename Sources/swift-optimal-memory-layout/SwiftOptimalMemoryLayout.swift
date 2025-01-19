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
    _ variables: [String:OptimalMemoryLayoutVariable]
) = #externalMacro(module: "SwiftOptimalMemoryLayoutMacro", type: "Declare")

@attached(member, names: arbitrary)
public macro declare(
    defaultVisibility: VariableVisibility = .internal,
    _ variables: [OptimalMemoryLayoutVariable]
) = #externalMacro(module: "SwiftOptimalMemoryLayoutMacro", type: "Declare")