import simd
#if os(macOS)
import struct CoreGraphics.CGGeometry.CGFloat
#else
import struct CoreGraphics.CGFloat
#endif

public extension CGESimd4Support {
	@_transparent
	var indices: Range<Int> {
		return 0..<4
	}
	
	static var one: Self {
		return Self(CGFloat4(repeating: 1.0))
	}
}
