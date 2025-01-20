
struct Value {
    let annotation:String
    let parameters:[(String, String)]
    let indirect:Bool

    init<T>(indirect: Bool, _ type: T.Type, parameters: [(String, String)] = []) {
        self.init(indirect: indirect, String(describing: type).split(separator: ".self")[0], parameters: parameters)
    }
    init<T: StringProtocol>(indirect: Bool, _ annotation: T, parameters: [(String, String)] = []) {
        self.indirect = indirect
        self.annotation = String(annotation)
        self.parameters = parameters
    }
}
func get<T>(indirect: Bool = false, _ type: T.Type) -> Value { Value(indirect: indirect, type) }
func get(indirect: Bool = false, _ annotation: String, parameters: [(String, String)] = []) -> Value { Value(indirect: indirect, annotation, parameters: parameters) }

// MARK: Standard lib
var supported:[(String, Value)] = [
    ("bool", get(Bool.self)),
    ("char", get(Character.self)),
    ("string", get(String.self)),
    ("stringIndex", get("String.Index")),
    ("stringUTF8View", get("String.UTF8View")),
    ("stringUTF16View", get("String.UTF16View")),
    ("substring", get(Substring.self)),
    ("substringUTF8View", get("Substring.UTF8View")),
    ("substringUTF16View", get("Substring.UTF16View")),
    ("staticString", get(StaticString.self)),
    ("unicodeScalar", get("Unicode.Scalar")),

    ("continuousClock", get(ContinuousClock.self)),
    ("continuousClockDuration", get("ContinuousClock.Duration")),
    ("continuousClockInstant", get("ContinuousClock.Instant")),
    ("suspendingClock", get(SuspendingClock.self)),
    ("suspendingClockInstant", get("SuspendingClock.Instant")),

    ("staticBigInt", get(StaticBigInt.self)),
    ("int", get(Int.self)),
    ("int8", get(Int8.self)),
    ("int16", get(Int16.self)),
    ("int32", get(Int32.self)),
    ("int64", get(Int64.self)),

    ("uint", get(UInt.self)),
    ("uint8", get(UInt8.self)),
    ("uint16", get(UInt16.self)),
    ("uint32", get(UInt32.self)),
    ("uint64", get(UInt64.self)),

    ("float", get(Float.self)),
    ("double", get(Double.self))
]

// MARK: Generics
let generics:[(String, Value)] = [
    ("optional", get(indirect: true, "Optional", parameters: [("value", "MemoryLayoutable")])),
    ("simd2", get(indirect: true, "SIMD2", parameters: [("of", "MemoryLayoutable")])),
    ("simd3", get(indirect: true, "SIMD3", parameters: [("of", "MemoryLayoutable")])),
    ("simd4", get(indirect: true, "SIMD4", parameters: [("of", "MemoryLayoutable")])),
    ("simd8", get(indirect: true, "SIMD8", parameters: [("of", "MemoryLayoutable")])),
    ("simd16", get(indirect: true, "SIMD16", parameters: [("of", "MemoryLayoutable")])),
    ("simd32", get(indirect: true, "SIMD32", parameters: [("of", "MemoryLayoutable")])),
    ("simd64", get(indirect: true, "SIMD64", parameters: [("of", "MemoryLayoutable")])),

    ("array", get(indirect: true, "Array", parameters: [("of", "MemoryLayoutable")])),
    ("contiguousArray", get(indirect: true, "ContiguousArray", parameters: [("of", "MemoryLayoutable")])),
    ("slice", get(indirect: true, "Slice", parameters: [("of", "MemoryLayoutable")])),
    ("set", get(indirect: true, "Set", parameters: [("of", "MemoryLayoutable")])),
    ("collectionOfOne", get(indirect: true, "CollectionOfOne", parameters: [("of", "MemoryLayoutable")])),
    ("collectionDifference", get(indirect: true, "CollectionDifference", parameters: [("of", "MemoryLayoutable")])),
    ("keyValuePairs", get(indirect: true, "KeyValuePairs", parameters: [("key", "MemoryLayoutable"), ("value", "MemoryLayoutable")])),
    ("unfoldSequence", get(indirect: true, "UnfoldSequence", parameters: [("element", "MemoryLayoutable"), ("state", "MemoryLayoutable")])),
    ("repeated", get(indirect: true, "Repeated", parameters: [("of", "MemoryLayoutable")])),
    ("emptyCollection", get(indirect: true, "EmptyCollection", parameters: [("of", "MemoryLayoutable")])),
    ("indexingIterator", get(indirect: true, "IndexingIterator", parameters: [("of", "MemoryLayoutable")])),
    ("defaultIndicies", get(indirect: true, "DefaultIndices", parameters: [("elements", "MemoryLayoutable")])),
    ("dropFirstSequence", get(indirect: true, "DropFirstSequence", parameters: [("base", "MemoryLayoutable")])),
    ("prefixSequence", get(indirect: true, "PrefixSequence", parameters: [("base", "MemoryLayoutable")])),
    ("dropWhileSequence", get(indirect: true, "DropWhileSequence", parameters: [("base", "MemoryLayoutable")])),
    ("iteratorSequence", get(indirect: true, "IteratorSequence", parameters: [("base", "MemoryLayoutable")])),
    ("lazySequence", get(indirect: true, "LazySequence", parameters: [("of", "MemoryLayoutable")])),
    ("zip2Sequence", get(indirect: true, "Zip2Sequence", parameters: [("sequence1", "MemoryLayoutable"), ("sequence2", "MemoryLayoutable")])),
    ("reversedCollection", get(indirect: true, "ReversedCollection", parameters: [("base", "MemoryLayoutable")])),
    ("enumeratedSequence", get(indirect: true, "EnumeratedSequence", parameters: [("base", "MemoryLayoutable")])),
    ("lazyPrefixWhileSequence", get(indirect: true, "LazyPrefixWhileSequence", parameters: [("base", "MemoryLayoutable")])),
    ("lazyFilterSequence", get(indirect: true, "LazyFilterSequence", parameters: [("base", "MemoryLayoutable")])),
    ("joinedSequence", get(indirect: true, "JoinedSequence", parameters: [("base", "MemoryLayoutable")])),
    ("flattenSequence", get(indirect: true, "FlattenSequence", parameters: [("base", "MemoryLayoutable")])),
    ("lazyMapSequence", get(indirect: true, "LazyMapSequence", parameters: [("base", "MemoryLayoutable"), ("element", "MemoryLayoutable")])),
    ("lazyDropWhileSequence", get(indirect: true, "LazyDropWhileSequence", parameters: [("base", "MemoryLayoutable")])),
    ("discontiguousSlice", get(indirect: true, "DiscontiguousSlice", parameters: [("base", "MemoryLayoutable")])),

    ("dictionary", get(indirect: true, "Dictionary", parameters: [("key", "MemoryLayoutable"), ("value", "MemoryLayoutable")])),
    
    ("range", get(indirect: true, "Range", parameters: [("bound", "MemoryLayoutable")])),
    ("partialRangeFrom", get(indirect: true, "PartialRangeFrom", parameters: [("bound", "MemoryLayoutable")])),
    ("partialRangeThrough", get(indirect: true, "PartialRangeThrough", parameters: [("bound", "MemoryLayoutable")])),
    ("partialRangeUpTo", get(indirect: true, "PartialRangeUpTo", parameters: [("bound", "MemoryLayoutable")])),

    ("strideThrough", get(indirect: true, "StrideThrough", parameters: [("element", "MemoryLayoutable")])),
    ("strideThroughIterator", get(indirect: true, "StrideThroughIterator", parameters: [("element", "MemoryLayoutable")])),
    ("strideTo", get(indirect: true, "StrideTo", parameters: [("element", "MemoryLayoutable")])),
    ("strideToIterator", get(indirect: true, "StrideToIterator", parameters: [("element", "MemoryLayoutable")])),
]
//supported.append(contentsOf: generics)

// MARK: Swift >= 6
#if compiler(>=6.0)
let swift6:[(String, Value)] = [
    ("int128", get(Int128.self)),
    ("uint128", get(UInt128.self)),

    //("rangeSet", get(indirect: true, "RangeSet", parameters: [("bound", "MemoryLayoutable")]))
]
supported.append(contentsOf: swift6)
#endif

// MARK: Foundation
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

#if canImport(FoundationEssentials) || canImport(Foundation)
let foundation:[(String, Value)] = [
    ("stringCompareOptions", get("String.CompareOptions")),
    ("stringEncoding", get("String.Encoding")),
    ("attributedString", get(AttributedString.self)),
    
    ("data", get(Data.self)),
    ("date", get(Date.self)),
    ("dateComponents", get(DateComponents.self)),
    ("dateInterval", get(DateInterval.self)),
    ("decimal", get(Decimal.self)),
    ("locale", get(Locale.self)),
    ("localeCollation", get("Locale.Collation")),
    ("localeComponents", get("Locale.Components")),
    ("localeCurrency", get("Locale.Currency")),
    ("localeLanguage", get("Locale.Language")),
    ("localeLanguageComponents", get("Locale.Language.Components")),
    ("localeLanguageCode", get("Locale.LanguageCode")),
    ("localeLanguageDirection", get("Locale.LanguageDirection")),
    ("localeMeasurementSystem", get("Locale.MeasurementSystem")),
    ("localeNumberingSystem", get("Locale.NumberingSystem")),
    ("localeRegion", get("Locale.Region")),
    ("localeScript", get("Locale.Script")),
    ("localeSubdivision", get("Locale.Subdivision")),
    ("localeVariant", get("Locale.Variant")),
    ("timeZone", get(TimeZone.self)),
    ("url", get(URL.self)),
    ("urlComponents", get(URLComponents.self)),
    ("urlQueryItem", get(URLQueryItem.self)),
    ("uuid", get(UUID.self))
]
supported.append(contentsOf: foundation)
#endif

var cases:String = ""
var initialize:String = "extension MemoryLayoutable {\n    public init?<T: StringProtocol>(rawValue: T) {\n        switch rawValue {"
var types:String = "extension MemoryLayoutable {\n    @inlinable public var protocolType : MemoryLayoutableProtocol.Type {\n        switch self {"
var extensions:String = ""
for (caseName, value) in supported {
    let parameters:String = value.parameters.isEmpty ? "" : "(" + value.parameters.map({ $0.0 + ": " + $0.1 }).joined(separator: ", ") + ")"
    cases += "\n    " + (value.indirect ? "indirect " : "") + "case " + caseName + parameters
    initialize += "\n        case \"\(caseName)\": self = .\(caseName)"
    types += "\n        case .\(caseName): return " + value.annotation + ".self"
    extensions += "\nextension " + value.annotation + " : MemoryLayoutableProtocol {}"
}
types += "\n        }\n    }\n}"
initialize += "\n        default: return nil"
initialize += "\n        }\n    }\n}"
let memoryLayout:String = "@inlinable public var memoryLayout : (alignment: Int, size: Int, stride: Int) { protocolType.memoryLayout }"
let header:String = """
//
//  MemoryLayoutable.swift
//
//
//  Generated by Evan Anderson at \(Date.now.formatted(.iso8601)).
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

"""
var string:String = header + "\npublic enum MemoryLayoutable {" + cases + "\n\n    " + memoryLayout + "\n}\n"
string += "\n\(initialize)\n"
string += "\n\(types)\n"
string += "\n\(extensions)\n"
print(string)

struct Block {
    let values:[(String, Value)]
    let compilerCondition:String

    init(_ values: [(String, Value)], compilerCondition: String = "") {
        self.values = values
        self.compilerCondition = compilerCondition
    }

    private func result(_ input: String) -> String {
        var string:String = compilerCondition
        string += input
        if !compilerCondition.isEmpty {
            string += "\n#endif\n"
        }
        return string
    }

    func cases() -> String {
        var string:String = ""
        for (caseName, value) in values {
            let parameters:String = value.parameters.isEmpty ? "" : "(" + value.parameters.map({ $0.0 + ": " + $0.1 }).joined(separator: ", ") + ")"
            string += "\n    " + (value.indirect ? "indirect " : "") + "case " + caseName + parameters
        }
        return result(string)
    }

    func types() -> String {
        var string:String = ""
        return string
    }

    func extensions() -> String {
        var string:String = ""
        for (_, value) in values {
            string += "\nextension " + value.annotation + " : MemoryLayoutableProtocol {}"
        }
        return result(string)
    }

    func stepForward(_ input: Int) -> Int {
        return input + 1
    }
    func stepBackward(_ input: Int) -> Int {
        return input - 1
    }
    func chooseStepFunction(backward: Bool) -> (Int) -> Int {
        return backward ? stepBackward : stepForward
    }
}