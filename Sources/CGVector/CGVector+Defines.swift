#if os(macOS)
import struct CoreGraphics.CGGeometry.CGFloat
import struct CoreGraphics.CGGeometry.CGVector
#else
import struct CoreGraphics.CGFloat
import struct CoreGraphics.CGVector
#endif

public extension CGVector {
	@_transparent
	var indices: Range<Int> {
		return 0..<2
	}
	
	subscript(index: Int) -> CGFloat {
		switch index {
		case 0: return dx
		case 1: return dy
		default:
			fatalError("Array index out of range")
		}
	}
	
	@inlinable
	static var unitX: CGVector {
		return CGVector(dx: 1.0, dy: 0.0)
	}
	
	@inlinable
	static var unitY: CGVector {
		return CGVector(dx: 0.0, dy: 1.0)
	}
}

// MARK: - CGESimdSupport2
extension CGVector: CGESimd2Support {
	public init(_ value: CGFloat2) {
		self.init(dx: CGFloat(value.x), dy: CGFloat(value.y))
	}
	
	public var simd: CGFloat2 {
		return CGFloat2(dx.native, dy.native)
	}
}
