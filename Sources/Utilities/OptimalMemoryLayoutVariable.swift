//
//  OptimalMemoryLayoutVariable.swift
//
//
//  Created by Evan Anderson on 1/18/25.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public struct OptimalMemoryLayoutVariable {
    public let documentation:[String]
    public let name:String
    public let typeAnnotation:Substring
    public let typeMemoryLayout:(alignment: Int, size: Int, stride: Int)
    public let mutable:Bool
    public package(set) var visibility:VariableVisibility

    public init(
        visibility: VariableVisibility = .internal,
        mutable: Bool,
        name: String,
        type: MemoryLayoutable,
        documentation: [String] = []
    ) {
        self.init(visibility: visibility, mutable: mutable, name: name, typeAnnotation: String("\(type.protocolType)".split(separator: ".")[0]), typeMemoryLayout: type.memoryLayout, documentation: documentation)
    }

    public init(
        visibility: VariableVisibility = .internal,
        mutable: Bool,
        name: String,
        typeAnnotation: String,
        typeMemoryLayout: (alignment: Int, size: Int, stride: Int),
        documentation: [String] = []
    ) {
        self.visibility = visibility
        self.mutable = mutable
        self.name = name
        self.typeAnnotation = Substring(typeAnnotation)
        self.typeMemoryLayout = typeMemoryLayout
        self.documentation = documentation
    }

    @inlinable
    public static func layout<T>(for: T.Type) -> (alignment: Int, size: Int, stride: Int) {
        return (MemoryLayout<T>.alignment, MemoryLayout<T>.size, MemoryLayout<T>.stride)
    }

    // MARK: Description
    @inlinable
    public func description(indentation: String) -> String {
        var string:String = "\n"
        if !documentation.isEmpty {
            for doc in documentation {
                string += indentation + "/// " + doc + "\n"
            }
        }
        string += indentation + (visibility != .internal ? visibility.rawValue + " " : "") + (mutable ? "var" : "let") + " " + name + ":" + typeAnnotation
        return string
    }
}

// MARK: Convenience
extension OptimalMemoryLayoutVariable {
    public static func `var`(
        visibility: VariableVisibility = .internal,
        name: String,
        typeAnnotation: String,
        typeMemoryLayout: (alignment: Int, size: Int, stride: Int),
        documentation: [String] = []
    ) -> Self {
        return Self(visibility: visibility, mutable: true, name: name, typeAnnotation: typeAnnotation, typeMemoryLayout: typeMemoryLayout, documentation: documentation)
    }

    public static func `var`(
        visibility: VariableVisibility = .internal,
        name: String,
        type: MemoryLayoutable,
        documentation: [String] = []
    ) -> Self {
        return Self(visibility: visibility, mutable: true, name: name, type: type, documentation: documentation)
    }
}

extension OptimalMemoryLayoutVariable {
    public static func `let`(
        visibility: VariableVisibility = .internal,
        name: String,
        typeAnnotation: String,
        typeMemoryLayout: (alignment: Int, size: Int, stride: Int),
        documentation: [String] = []
    ) -> Self {
        return Self(visibility: visibility, mutable: false, name: name, typeAnnotation: typeAnnotation, typeMemoryLayout: typeMemoryLayout, documentation: documentation)
    }

    public static func `let`(
        visibility: VariableVisibility = .internal,
        name: String,
        type: MemoryLayoutable,
        documentation: [String] = []
    ) -> Self {
        return Self(visibility: visibility, mutable: false, name: name, type: type, documentation: documentation)
    }
}