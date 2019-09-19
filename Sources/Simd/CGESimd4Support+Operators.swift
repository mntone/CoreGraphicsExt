import simd
#if os(macOS)
import struct CoreGraphics.CGGeometry.CGFloat
#else
import struct CoreGraphics.CGFloat
#endif

public extension CGESimd4Support {
	// MARK: ? V
	static prefix func - (rhs: Self) -> Self {
		return Self(-rhs.simd)
	}
	
	// MARK: V ? V
	static func + (lhs: Self, rhs: Self) -> Self {
		return Self(lhs.simd + rhs.simd)
	}
	
	static func - (lhs: Self, rhs: Self) -> Self {
		return Self(lhs.simd - rhs.simd)
	}
	
	static func * (lhs: Self, rhs: Self) -> Self {
		return Self(lhs.simd * rhs.simd)
	}
	
	static func / (lhs: Self, rhs: Self) -> Self {
		return Self(lhs.simd / rhs.simd)
	}
	
	// MARK: C ? V
	static func + (lhs: CGFloat, rhs: Self) -> Self {
		return Self(SimdType(repeating: lhs.native) + rhs.simd)
	}
	
	static func - (lhs: CGFloat, rhs: Self) -> Self {
		return Self(SimdType(repeating: lhs.native) - rhs.simd)
	}
	
	static func * (lhs: CGFloat, rhs: Self) -> Self {
		return Self(lhs.native * rhs.simd)
	}
	
	static func / (lhs: CGFloat, rhs: Self) -> Self {
		return Self(SimdType(repeating: lhs.native) / rhs.simd)
	}
	
	// MARK: V ? C
	static func + (lhs: Self, rhs: CGFloat) -> Self {
		return Self(lhs.simd + SimdType(repeating: rhs.native))
	}
	
	static func - (lhs: Self, rhs: CGFloat) -> Self {
		return Self(lhs.simd - SimdType(repeating: rhs.native))
	}
	
	static func * (lhs: Self, rhs: CGFloat) -> Self {
		return Self(lhs.simd * rhs.native)
	}
	
	static func / (lhs: Self, rhs: CGFloat) -> Self {
		return Self(lhs.simd / rhs.native)
	}
	
	// MARK: V ?= V
	static func += (lhs: inout Self, rhs: Self) {
		lhs = Self(lhs.simd + rhs.simd)
	}
	
	static func -= (lhs: inout Self, rhs: Self) {
		lhs = Self(lhs.simd - rhs.simd)
	}
	
	static func *= (lhs: inout Self, rhs: Self) {
		lhs = Self(lhs.simd * rhs.simd)
	}
	
	static func /= (lhs: inout Self, rhs: Self) {
		lhs = Self(lhs.simd / rhs.simd)
	}
	
	// MARK: V ?= C
	static func += (lhs: inout Self, rhs: CGFloat) {
		lhs = Self(lhs.simd + SimdType(repeating: rhs.native))
	}
	
	static func -= (lhs: inout Self, rhs: CGFloat) {
		lhs = Self(lhs.simd - SimdType(repeating: rhs.native))
	}
	
	static func *= (lhs: inout Self, rhs: CGFloat) {
		lhs = Self(lhs.simd * rhs.native)
	}
	
	static func /= (lhs: inout Self, rhs: CGFloat) {
		lhs = Self(lhs.simd / rhs.native)
	}
}
