//
//  MemoryLayoutable.swift
//
//
//  Created by Evan Anderson on 1/19/25.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public enum MemoryLayoutable : String, CaseIterable {
    case bool
    case char
    case string
    case stringCompareOptions
    case stringEncoding
    case stringIndex
    case stringUTF8View
    case stringUTF16View
    case substring
    case substringUTF8View
    case substringUTF16View

    case int
    case int8
    case int16
    case int32
    case int64

    case uint
    case uint8
    case uint16
    case uint32
    case uint64

    case simd64UInt
    case simd64UInt8
    case simd64UInt16
    case simd64UInt32
    case simd64UInt64

    @inlinable
    public var type : MemoryLayoutableProtocol.Type {
        switch self {
        case .bool: return Bool.self
        case .char: return Character.self
        case .string: return String.self
        case .stringCompareOptions: return String.CompareOptions.self
        case .stringEncoding: return String.Encoding.self
        case .stringIndex: return String.Index.self
        case .stringUTF8View: return String.UTF8View.self
        case .stringUTF16View: return String.UTF16View.self
        case .substring: return Substring.self
        case .substringUTF8View: return Substring.UTF8View.self
        case .substringUTF16View: return Substring.UTF16View.self

        case .int: return Int.self
        case .int8: return Int8.self
        case .int16: return Int16.self
        case .int32: return Int32.self
        case .int64: return Int64.self

        case .uint: return UInt.self
        case .uint8: return UInt8.self
        case .uint16: return UInt16.self
        case .uint32: return UInt32.self
        case .uint64: return UInt64.self

        case .simd64UInt: return SIMD64<UInt>.self
        case .simd64UInt8: return SIMD64<UInt8>.self
        case .simd64UInt16: return SIMD64<UInt16>.self
        case .simd64UInt32: return SIMD64<UInt32>.self
        case .simd64UInt64: return SIMD64<UInt64>.self
        }
    }

    @inlinable
    public var memoryLayout : (alignment: Int, size: Int, stride: Int) {
        return type.memoryLayout
    }
}