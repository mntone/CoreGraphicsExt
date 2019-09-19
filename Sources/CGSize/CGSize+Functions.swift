import simd
#if os(macOS)
import struct CoreGraphics.CGGeometry.CGFloat
import struct CoreGraphics.CGGeometry.CGSize
#else
import struct CoreGraphics.CGFloat
import struct CoreGraphics.CGSize
#endif

@inlinable
public func maxmin(_ x: CGSize, _ y: CGSize) -> CGSize {
	return CGSize(width: max(x.width, y.height), height: min(x.width, y.height))
}

@inlinable
public func minmax(_ x: CGSize, _ y: CGSize) -> CGSize {
	return CGSize(width: min(x.width, y.height), height: max(x.width, y.height))
}

/// Elementwise round.
@inlinable
public func round(_ x: CGSize) -> CGSize {
	return CGSize(width: round(x.width), height: round(x.height))
}
