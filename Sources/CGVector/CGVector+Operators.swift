import simd
#if os(macOS)
import struct CoreGraphics.CGGeometry.CGFloat
import struct CoreGraphics.CGGeometry.CGVector
#else
import struct CoreGraphics.CGFloat
import struct CoreGraphics.CGVector
#endif

infix operator +-: AdditionPrecedence
infix operator -+: AdditionPrecedence
infix operator +-=: AssignmentPrecedence
infix operator -+=: AssignmentPrecedence

public extension CGVector {
	// MARK: V ? V
	static func +- (lhs: CGVector, rhs: CGVector) -> CGVector {
		return CGVector(dx: lhs.dx + rhs.dx, dy: lhs.dy - rhs.dy)
	}
	
	static func -+ (lhs: CGVector, rhs: CGVector) -> CGVector {
		return CGVector(dx: lhs.dx - rhs.dx, dy: lhs.dy + rhs.dy)
	}
	
	// MARK: C ? V
	static func +- (lhs: CGFloat, rhs: CGVector) -> CGVector {
		return CGVector(dx: lhs + rhs.dx, dy: lhs - rhs.dy)
	}
	
	static func -+ (lhs: CGFloat, rhs: CGVector) -> CGVector {
		return CGVector(dx: lhs - rhs.dx, dy: lhs + rhs.dy)
	}
	
	// MARK: V ? C
	static func +- (lhs: CGVector, rhs: CGFloat) -> CGVector {
		return CGVector(dx: lhs.dx + rhs, dy: lhs.dy - rhs)
	}
	
	static func -+ (lhs: CGVector, rhs: CGFloat) -> CGVector {
		return CGVector(dx: lhs.dx - rhs, dy: lhs.dy + rhs)
	}
	
	// MARK: V ?= V
	static func +-= (lhs: inout CGVector, rhs: CGVector) {
		lhs = CGVector(dx: lhs.dx + rhs.dx, dy: lhs.dy - rhs.dy)
	}
	
	static func -+= (lhs: inout CGVector, rhs: CGVector) {
		lhs = CGVector(dx: lhs.dx - rhs.dx, dy: lhs.dy + rhs.dy)
	}
	
	// MARK: V ?= C
	static func +-= (lhs: inout CGVector, rhs: CGFloat) {
		lhs = CGVector(dx: lhs.dx + rhs, dy: lhs.dy - rhs)
	}
	
	static func -+= (lhs: inout CGVector, rhs: CGFloat) {
		lhs = CGVector(dx: lhs.dx - rhs, dy: lhs.dy + rhs)
	}
}
