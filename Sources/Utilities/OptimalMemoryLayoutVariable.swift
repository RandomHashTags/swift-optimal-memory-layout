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
    public var visibility:VariableVisibility
    public let name:String
    public let typeAnnotation:String
    public let typeMemoryLayout:(alignment: Int, size: Int, stride: Int)
    public let mutable:Bool

    public init<T>(
        visibility: VariableVisibility = .internal,
        mutable: Bool,
        name: String,
        type: T.Type,
        documentation: [String] = []
    ) {
        self.init(visibility: visibility, mutable: mutable, name: name, typeAnnotation: String("\(type)".split(separator: ".")[0]), typeMemoryLayout: Self.memoryLayout(for: type), documentation: documentation)
    }
    public init(
        visibility: VariableVisibility = .internal,
        mutable: Bool,
        name: String,
        typeAnnotation: String,
        typeMemoryLayout: (alignment: Int, size: Int, stride: Int)? = nil,
        documentation: [String] = []
    ) {
        self.visibility = visibility
        self.mutable = mutable
        self.name = name
        self.typeAnnotation = typeAnnotation
        var typeMemoryLayout:(alignment: Int, size: Int, stride: Int)? = typeMemoryLayout
        if typeMemoryLayout == nil {
            typeMemoryLayout = Self.parseMemoryLayout(typeAnnotation)
        }
        if let typeMemoryLayout, typeMemoryLayout.alignment > 0 && typeMemoryLayout.size > 0 && typeMemoryLayout.stride > 0 {
            self.typeMemoryLayout = typeMemoryLayout
        } else {
            self.typeMemoryLayout = (0, 0, 0)
        }
        self.documentation = documentation
    }

    // MARK: Parse memory layout
    @inlinable
    static func parseMemoryLayout(_ typeAnnotation: String) -> (Int, Int, Int)? {
        switch typeAnnotation {
        // MARK: Standard lib
        case "Bool": return memoryLayout(for: Bool.self)
        case "Character": return memoryLayout(for: Character.self)
        case "String": return memoryLayout(for: String.self)
        case "String.Index": return memoryLayout(for: String.Index.self)
        case "String.UTF8View": return memoryLayout(for: String.UTF8View.self)
        case "String.UTF16View": return memoryLayout(for: String.UTF16View.self)
        case "Substring": return memoryLayout(for: Substring.self)
        case "Substring.Index": return memoryLayout(for: Substring.Index.self)
        case "StaticString": return memoryLayout(for: StaticString.self)
        case "Unicode.Scalar": return memoryLayout(for: Unicode.Scalar.self)

        case "ContinuousClock": return memoryLayout(for: ContinuousClock.self)
        case "ContinuousClock.Instant": return memoryLayout(for: ContinuousClock.Instant.self)
        case "SuspendingClock": return memoryLayout(for: SuspendingClock.self)
        case "SuspendingClock.Instant": return memoryLayout(for: SuspendingClock.Instant.self)

        case "Int": return memoryLayout(for: Int.self)
        case "Int8": return memoryLayout(for: Int8.self)
        case "Int16": return memoryLayout(for: Int16.self)
        case "Int32": return memoryLayout(for: Int32.self)
        case "Int64": return memoryLayout(for: Int64.self)

        case "UInt": return memoryLayout(for: UInt.self)
        case "UInt8": return memoryLayout(for: UInt8.self)
        case "UInt16": return memoryLayout(for: UInt16.self)
        case "UInt32": return memoryLayout(for: UInt32.self)
        case "UInt64": return memoryLayout(for: UInt64.self)

        case "Float": return memoryLayout(for: Float.self)
        case "Double": return memoryLayout(for: Double.self)

        case "SIMD2<Int>": return memoryLayout(for: SIMD2<Int>.self)
        case "SIMD2<Int8>": return memoryLayout(for: SIMD2<Int8>.self)
        case "SIMD2<Int16>": return memoryLayout(for: SIMD2<Int16>.self)
        case "SIMD2<Int32>": return memoryLayout(for: SIMD2<Int32>.self)
        case "SIMD2<Int64>": return memoryLayout(for: SIMD2<Int64>.self)
        case "SIMD2<UInt>": return memoryLayout(for: SIMD2<UInt>.self)
        case "SIMD2<UInt8>": return memoryLayout(for: SIMD2<UInt8>.self)
        case "SIMD2<UInt16>": return memoryLayout(for: SIMD2<UInt16>.self)
        case "SIMD2<UInt32>": return memoryLayout(for: SIMD2<UInt32>.self)
        case "SIMD2<UInt64>": return memoryLayout(for: SIMD2<UInt64>.self)

        case "SIMD4<Int>": return memoryLayout(for: SIMD4<Int>.self)
        case "SIMD4<Int8>": return memoryLayout(for: SIMD4<Int8>.self)
        case "SIMD4<Int16>": return memoryLayout(for: SIMD4<Int16>.self)
        case "SIMD4<Int32>": return memoryLayout(for: SIMD4<Int32>.self)
        case "SIMD4<Int64>": return memoryLayout(for: SIMD4<Int64>.self)

        case "SIMD8<Int>": return memoryLayout(for: SIMD8<Int>.self)
        case "SIMD8<Int8>": return memoryLayout(for: SIMD8<Int8>.self)
        case "SIMD8<Int16>": return memoryLayout(for: SIMD8<Int16>.self)
        case "SIMD8<Int32>": return memoryLayout(for: SIMD8<Int32>.self)
        case "SIMD8<Int64>": return memoryLayout(for: SIMD8<Int64>.self)

        case "SIMD16<Int>": return memoryLayout(for: SIMD16<Int>.self)
        case "SIMD16<Int8>": return memoryLayout(for: SIMD16<Int8>.self)
        case "SIMD16<Int16>": return memoryLayout(for: SIMD16<Int16>.self)
        case "SIMD16<Int32>": return memoryLayout(for: SIMD16<Int32>.self)
        case "SIMD16<Int64>": return memoryLayout(for: SIMD16<Int64>.self)

        case "SIMD32<Int>": return memoryLayout(for: SIMD32<Int>.self)
        case "SIMD32<Int8>": return memoryLayout(for: SIMD32<Int8>.self)
        case "SIMD32<Int16>": return memoryLayout(for: SIMD32<Int16>.self)
        case "SIMD32<Int32>": return memoryLayout(for: SIMD32<Int32>.self)
        case "SIMD32<Int64>": return memoryLayout(for: SIMD32<Int64>.self)

        case "SIMD64<Int>": return memoryLayout(for: SIMD64<Int>.self)
        case "SIMD64<Int8>": return memoryLayout(for: SIMD64<Int8>.self)
        case "SIMD64<Int16>": return memoryLayout(for: SIMD64<Int16>.self)
        case "SIMD64<Int32>": return memoryLayout(for: SIMD64<Int32>.self)
        case "SIMD64<Int64>": return memoryLayout(for: SIMD64<Int64>.self)
        case "SIMD64<UInt>": return memoryLayout(for: SIMD64<UInt>.self)
        case "SIMD64<UInt8>": return memoryLayout(for: SIMD64<UInt8>.self)
        case "SIMD64<UInt16>": return memoryLayout(for: SIMD64<UInt16>.self)
        case "SIMD64<UInt32>": return memoryLayout(for: SIMD64<UInt32>.self)
        case "SIMD64<UInt64>": return memoryLayout(for: SIMD64<UInt64>.self)

        case "SIMD2<Float>": return memoryLayout(for: SIMD2<Float>.self)
        case "SIMD4<Float>": return memoryLayout(for: SIMD4<Float>.self)
        case "SIMD8<Float>": return memoryLayout(for: SIMD8<Float>.self)
        case "SIMD32<Float>": return memoryLayout(for: SIMD32<Float>.self)
        case "SIMD16<Float>": return memoryLayout(for: SIMD16<Float>.self)
        case "SIMD64<Float>": return memoryLayout(for: SIMD64<Float>.self)

        case "SIMD2<Double>": return memoryLayout(for: SIMD2<Double>.self)
        case "SIMD4<Double>": return memoryLayout(for: SIMD4<Double>.self)
        case "SIMD8<Double>": return memoryLayout(for: SIMD8<Double>.self)
        case "SIMD16<Double>": return memoryLayout(for: SIMD16<Double>.self)
        case "SIMD32<Double>": return memoryLayout(for: SIMD32<Double>.self)
        case "SIMD64<Double>": return memoryLayout(for: SIMD64<Double>.self)

        // MARK: Swift >= 6
        #if compiler(>=6.0)
        case "Int128": return memoryLayout(for: Int128.self)
        case "UInt128": return memoryLayout(for: UInt128.self)
        #endif

        // MARK: Foundation
        #if canImport(FoundationEssentials) || canImport(Foundation)
        case "Data": return memoryLayout(for: Data.self)
        case "Date": return memoryLayout(for: Date.self)
        case "DateComponents": return memoryLayout(for: DateComponents.self)
        case "DateInterval": return memoryLayout(for: DateInterval.self)
        case "Decimal": return memoryLayout(for: Decimal.self)
        case "Locale": return memoryLayout(for: Locale.self)
        case "Locale.Currency": return memoryLayout(for: Locale.Currency.self)
        case "Locale.Language": return memoryLayout(for: Locale.Language.self)
        case "Locale.LanguageCode": return memoryLayout(for: Locale.LanguageCode.self)
        case "Locale.Script": return memoryLayout(for: Locale.Script.self)
        case "Locale.Subdivision": return memoryLayout(for: Locale.Subdivision.self)
        #endif
        default:
            if typeAnnotation.hasSuffix(">") && (
                    typeAnnotation.hasPrefix("Array<")
                    || typeAnnotation.hasPrefix("ArraySlice<")
                    || typeAnnotation.hasPrefix("ContiguousArray<")
                    || typeAnnotation.hasPrefix("Set<")
                    || typeAnnotation.hasPrefix("Sequence<")
                    || typeAnnotation.hasPrefix("Collection<")
                )
                || typeAnnotation.hasPrefix("[") && typeAnnotation.hasSuffix("]") // arrays, collections, dictionaries, sequences, sets, slices
                {
                return (8, 8, 8)
            } else {
                return nil
            }
        }
    }

    @inlinable
    static func memoryLayout<T>(for: T.Type) -> (alignment: Int, size: Int, stride: Int) {
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
        typeMemoryLayout: (Int, Int, Int)? = nil,
        documentation: [String] = []
    ) -> Self {
        return Self(visibility: visibility, mutable: true, name: name, typeAnnotation: typeAnnotation, typeMemoryLayout: typeMemoryLayout, documentation: documentation)
    }

    public static func `var`<T>(
        visibility: VariableVisibility = .internal,
        name: String,
        type: T.Type,
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
        typeMemoryLayout: (Int, Int, Int)? = nil,
        documentation: [String] = []
    ) -> Self {
        return Self(visibility: visibility, mutable: false, name: name, typeAnnotation: typeAnnotation, typeMemoryLayout: typeMemoryLayout, documentation: documentation)
    }

    public static func `let`<T>(
        visibility: VariableVisibility = .internal,
        name: String,
        type: T.Type,
        documentation: [String] = []
    ) -> Self {
        return Self(visibility: visibility, mutable: false, name: name, type: type, documentation: documentation)
    }
}