import simd
#if os(macOS)
import struct CoreGraphics.CGGeometry.CGFloat
#else
import struct CoreGraphics.CGFloat
#endif

public extension CGESimd2Support {
	static var one: Self {
		return Self(CGFloat2(repeating: 1.0))
	}
}
