import simd
#if os(macOS)
import struct CoreGraphics.CGGeometry.CGFloat
#else
import struct CoreGraphics.CGFloat
#endif

public typealias CGFloat4 = SIMD4<CGFloat.NativeType>

public protocol CGESimd4Support: CGESimdSupport where SimdType == CGFloat4 {}

public extension CGESimd4Support {
	@inlinable
	mutating func clamp(lowerBound: Self, upperBound: Self) {
		self = Self(simd.clamped(lowerBound: lowerBound.simd, upperBound: upperBound.simd))
	}
	
	@inlinable
	func clamped(lowerBound: Self, upperBound: Self) -> Self {
		return Self(simd.clamped(lowerBound: lowerBound.simd, upperBound: upperBound.simd))
	}
	
	/// The least element in the vector.
	@inlinable
	func min() -> CGFloat {
		return CGFloat(simd.min())
	}
	
	/// The greatest element in the vector.
	@inlinable
	func max() -> CGFloat {
		return CGFloat(simd.max())
	}
	
	@inlinable
	mutating func round(_ rule: FloatingPointRoundingRule) {
		self = Self(simd.rounded(rule))
	}
	
	@inlinable
	func rounded(_ rule: FloatingPointRoundingRule) -> Self {
		return Self(simd.rounded(rule))
	}
	
	/// Returns the sum of the scalars in the vector.
	@inlinable
	func sum() -> CGFloat {
		return CGFloat(simd.sum())
	}
}
