#if os(macOS)
import struct CoreGraphics.CGGeometry.CGFloat
import struct CoreGraphics.CGGeometry.CGRect
#else
import struct CoreGraphics.CGFloat
import struct CoreGraphics.CGRect
#endif

public extension CGRect {
	@_transparent
	var indices: Range<Int> {
		return 0..<4
	}
	
	subscript(index: Int) -> CGFloat {
		switch index {
		case 0: return origin.x
		case 1: return origin.y
		case 2: return size.width
		case 3: return size.height
		default:
			fatalError("Array index out of range")
		}
	}
}

// MARK: - CGESimdSupport4
extension CGRect: CGESimd4Support {
	public init(_ value: CGFloat4) {
		self.init(x: CGFloat(value.x), y: CGFloat(value.y), width: CGFloat(value.z), height: CGFloat(value.w))
	}
	
	public var simd: CGFloat4 {
		return CGFloat4(origin.x.native, origin.y.native, size.width.native, size.height.native)
	}
}
