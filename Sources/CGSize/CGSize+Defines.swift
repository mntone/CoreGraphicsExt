#if os(macOS)
import struct CoreGraphics.CGGeometry.CGFloat
import struct CoreGraphics.CGGeometry.CGSize
#else
import struct CoreGraphics.CGFloat
import struct CoreGraphics.CGSize
#endif

public extension CGSize {
	@_transparent
	var indices: Range<Int> {
		return 0..<2
	}
	
	subscript(index: Int) -> CGFloat {
		switch index {
		case 0: return width
		case 1: return height
		default:
			fatalError("Array index out of range")
		}
	}
}

// MARK: - CGESimdSupport2
extension CGSize: CGESimd2Support {
	public init(_ value: CGFloat2) {
		self.init(width: CGFloat(value.x), height: CGFloat(value.y))
	}
	
	public var simd: CGFloat2 {
		return CGFloat2(width.native, height.native)
	}
}
