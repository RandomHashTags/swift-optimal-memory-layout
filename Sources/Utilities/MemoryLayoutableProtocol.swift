//
//  MemoryLayoutableProtocol.swift
//
//
//  Created by Evan Anderson on 1/18/25.
//

public protocol MemoryLayoutableProtocol {
    /// Memory layout for this type.
    static var memoryLayout : (alignment: Int, size: Int, stride: Int) { get }
}

extension MemoryLayoutableProtocol {
    @inlinable
    public static var memoryLayout : (alignment: Int, size: Int, stride: Int) { OptimalMemoryLayoutVariable.layout(for: Self.self) }
}