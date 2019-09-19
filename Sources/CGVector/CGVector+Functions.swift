import simd
#if os(macOS)
import struct CoreGraphics.CGGeometry.CGFloat
import struct CoreGraphics.CGGeometry.CGVector
#else
import struct CoreGraphics.CGFloat
import struct CoreGraphics.CGVector
#endif

@inlinable
public func maxmin(_ x: CGVector, _ y: CGVector) -> CGVector {
	return CGVector(dx: max(x.dx, y.dx), dy: min(x.dy, y.dy))
}

@inlinable
public func minmax(_ x: CGVector, _ y: CGVector) -> CGVector {
	return CGVector(dx: min(x.dx, y.dx), dy: max(x.dy, y.dy))
}

/// Elementwise round.
@inlinable
public func round(_ x: CGVector) -> CGVector {
	return CGVector(dx: round(x.dx), dy: round(x.dy))
}
