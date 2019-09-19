import simd
#if os(macOS)
import struct CoreGraphics.CGGeometry.CGFloat
import struct CoreGraphics.CGGeometry.CGSize
#else
import struct CoreGraphics.CGFloat
import struct CoreGraphics.CGSize
#endif

infix operator +-: AdditionPrecedence
infix operator -+: AdditionPrecedence
infix operator +-=: AssignmentPrecedence
infix operator -+=: AssignmentPrecedence

public extension CGSize {
	// MARK: V ? V
	static func +- (lhs: CGSize, rhs: CGSize) -> CGSize {
		return CGSize(width: lhs.width + rhs.width, height: lhs.height - rhs.height)
	}
	
	static func -+ (lhs: CGSize, rhs: CGSize) -> CGSize {
		return CGSize(width: lhs.width - rhs.width, height: lhs.height + rhs.height)
	}
	
	// MARK: C ? V
	static func +- (lhs: CGFloat, rhs: CGSize) -> CGSize {
		return CGSize(width: lhs + rhs.width, height: lhs - rhs.height)
	}
	
	static func -+ (lhs: CGFloat, rhs: CGSize) -> CGSize {
		return CGSize(width: lhs - rhs.width, height: lhs + rhs.height)
	}
	
	// MARK: V ? C
	static func +- (lhs: CGSize, rhs: CGFloat) -> CGSize {
		return CGSize(width: lhs.width + rhs, height: lhs.height - rhs)
	}
	
	static func -+ (lhs: CGSize, rhs: CGFloat) -> CGSize {
		return CGSize(width: lhs.width - rhs, height: lhs.height + rhs)
	}
	
	// MARK: V ?= V
	static func +-= (lhs: inout CGSize, rhs: CGSize) {
		lhs = CGSize(width: lhs.width + rhs.width, height: lhs.height - rhs.height)
	}
	
	static func -+= (lhs: inout CGSize, rhs: CGSize) {
		lhs = CGSize(width: lhs.width - rhs.width, height: lhs.height + rhs.height)
	}
	
	// MARK: V ?= C
	static func +-= (lhs: inout CGSize, rhs: CGFloat) {
		lhs = CGSize(width: lhs.width + rhs, height: lhs.height - rhs)
	}
	
	static func -+= (lhs: inout CGSize, rhs: CGFloat) {
		lhs = CGSize(width: lhs.width - rhs, height: lhs.height + rhs)
	}
}
