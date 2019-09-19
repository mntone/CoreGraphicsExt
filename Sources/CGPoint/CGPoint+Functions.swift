import simd
#if os(macOS)
import struct CoreGraphics.CGGeometry.CGFloat
import struct CoreGraphics.CGGeometry.CGPoint
#else
import struct CoreGraphics.CGFloat
import struct CoreGraphics.CGPoint
#endif

@inlinable
public func maxmin(_ x: CGPoint, _ y: CGPoint) -> CGPoint {
	return CGPoint(x: max(x.x, y.x), y: min(x.y, y.y))
}

@inlinable
public func minmax(_ x: CGPoint, _ y: CGPoint) -> CGPoint {
	return CGPoint(x: min(x.x, y.x), y: max(x.y, y.y))
}

/// Elementwise round.
@inlinable
public func round(_ x: CGPoint) -> CGPoint {
	return CGPoint(x: round(x.x), y: round(x.y))
}
