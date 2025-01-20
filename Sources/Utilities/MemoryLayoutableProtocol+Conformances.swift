//
//  MemoryLayoutableProtocol+Conformances.swift
//
//
//  Created by Evan Anderson on 1/19/25.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

/*
// MARK: Standard lib
extension Bool : MemoryLayoutableProtocol {}
extension Character : MemoryLayoutableProtocol {}
extension String : MemoryLayoutableProtocol {}
extension String.CompareOptions : MemoryLayoutableProtocol {}
extension String.Encoding : MemoryLayoutableProtocol {}
extension String.Index : MemoryLayoutableProtocol {}
extension String.UTF8View : MemoryLayoutableProtocol {}
extension String.UTF16View : MemoryLayoutableProtocol {}
extension Substring : MemoryLayoutableProtocol {}
extension Substring.UTF8View : MemoryLayoutableProtocol {}
extension Substring.UTF16View : MemoryLayoutableProtocol {}
extension StaticString : MemoryLayoutableProtocol {}
extension Unicode.Scalar : MemoryLayoutableProtocol {}
extension AttributedString : MemoryLayoutableProtocol {}

extension ContinuousClock : MemoryLayoutableProtocol {}
extension ContinuousClock.Duration : MemoryLayoutableProtocol {}
extension ContinuousClock.Instant : MemoryLayoutableProtocol {}
extension SuspendingClock : MemoryLayoutableProtocol {}
extension SuspendingClock.Instant : MemoryLayoutableProtocol {}

extension StaticBigInt : MemoryLayoutableProtocol {}

extension Int : MemoryLayoutableProtocol {}
extension Int8 : MemoryLayoutableProtocol {}
extension Int16 : MemoryLayoutableProtocol {}
extension Int32 : MemoryLayoutableProtocol {}
extension Int64 : MemoryLayoutableProtocol {}

extension UInt : MemoryLayoutableProtocol {}
extension UInt8 : MemoryLayoutableProtocol {}
extension UInt16 : MemoryLayoutableProtocol {}
extension UInt32 : MemoryLayoutableProtocol {}
extension UInt64 : MemoryLayoutableProtocol {}

extension Float : MemoryLayoutableProtocol {}
extension Double : MemoryLayoutableProtocol {}

extension SIMD2 : MemoryLayoutableProtocol {}
extension SIMD3 : MemoryLayoutableProtocol {}
extension SIMD4 : MemoryLayoutableProtocol {}
extension SIMD8 : MemoryLayoutableProtocol {}
extension SIMD16 : MemoryLayoutableProtocol {}
extension SIMD32 : MemoryLayoutableProtocol {}
extension SIMD64 : MemoryLayoutableProtocol {}

extension Array : MemoryLayoutableProtocol {}
extension ContiguousArray : MemoryLayoutableProtocol {}
extension Slice : MemoryLayoutableProtocol {}
extension Set : MemoryLayoutableProtocol {}
extension CollectionOfOne : MemoryLayoutableProtocol {}
extension CollectionDifference : MemoryLayoutableProtocol {}
extension KeyValuePairs : MemoryLayoutableProtocol {}
extension UnfoldSequence : MemoryLayoutableProtocol {}
extension Repeated : MemoryLayoutableProtocol {}
extension EmptyCollection : MemoryLayoutableProtocol {}
extension IndexingIterator : MemoryLayoutableProtocol {}
extension DefaultIndices : MemoryLayoutableProtocol {}
extension DropFirstSequence : MemoryLayoutableProtocol {}
extension PrefixSequence : MemoryLayoutableProtocol {}
extension DropWhileSequence : MemoryLayoutableProtocol {}
extension IteratorSequence : MemoryLayoutableProtocol {}
extension LazySequence : MemoryLayoutableProtocol {}
extension Zip2Sequence : MemoryLayoutableProtocol {}
extension ReversedCollection : MemoryLayoutableProtocol {}
extension EnumeratedSequence : MemoryLayoutableProtocol {}
extension LazyPrefixWhileSequence : MemoryLayoutableProtocol {}
extension LazyFilterSequence : MemoryLayoutableProtocol {}
extension JoinedSequence : MemoryLayoutableProtocol {}
extension FlattenSequence : MemoryLayoutableProtocol {}
extension LazyMapSequence : MemoryLayoutableProtocol {}
extension LazyDropWhileSequence : MemoryLayoutableProtocol {}
extension DiscontiguousSlice : MemoryLayoutableProtocol {}

extension Dictionary : MemoryLayoutableProtocol {}

extension Range : MemoryLayoutableProtocol {}

extension ClosedRange : MemoryLayoutableProtocol {}
extension PartialRangeFrom : MemoryLayoutableProtocol {}
extension PartialRangeThrough : MemoryLayoutableProtocol {}
extension PartialRangeUpTo : MemoryLayoutableProtocol {}

extension StrideThrough : MemoryLayoutableProtocol {}
extension StrideThroughIterator : MemoryLayoutableProtocol {}
extension StrideTo : MemoryLayoutableProtocol {}
extension StrideToIterator : MemoryLayoutableProtocol {}

// MARK: Swift >= 6
#if compiler(>=6.0)
extension Int128 : MemoryLayoutableProtocol {}
extension UInt128 : MemoryLayoutableProtocol {}

extension RangeSet : MemoryLayoutableProtocol {}
#endif

// MARK: Foundation
#if canImport(FoundationEssentials) || canImport(Foundation)
extension Data : MemoryLayoutableProtocol {}
extension Date : MemoryLayoutableProtocol {}
extension DateComponents : MemoryLayoutableProtocol {}
extension DateInterval : MemoryLayoutableProtocol {}
extension Decimal : MemoryLayoutableProtocol {}
extension Locale : MemoryLayoutableProtocol {}
extension Locale.Collation : MemoryLayoutableProtocol {}
extension Locale.Components : MemoryLayoutableProtocol {}
extension Locale.Currency : MemoryLayoutableProtocol {}
extension Locale.Language : MemoryLayoutableProtocol {}
extension Locale.Language.Components : MemoryLayoutableProtocol {}
extension Locale.LanguageCode : MemoryLayoutableProtocol {}
extension Locale.LanguageDirection : MemoryLayoutableProtocol {}
extension Locale.MeasurementSystem : MemoryLayoutableProtocol {}
extension Locale.NumberingSystem : MemoryLayoutableProtocol {}
extension Locale.Region : MemoryLayoutableProtocol {}
extension Locale.Script : MemoryLayoutableProtocol {}
extension Locale.Subdivision : MemoryLayoutableProtocol {}
extension Locale.Variant : MemoryLayoutableProtocol {}
extension TimeZone : MemoryLayoutableProtocol {}
extension URL : MemoryLayoutableProtocol {}
extension URLComponents : MemoryLayoutableProtocol {}
extension URLQueryItem : MemoryLayoutableProtocol {}
extension UUID : MemoryLayoutableProtocol {}
#endif*/