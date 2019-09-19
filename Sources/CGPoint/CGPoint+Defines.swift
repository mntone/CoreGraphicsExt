#if os(macOS)
import struct CoreGraphics.CGGeometry.CGFloat
import struct CoreGraphics.CGGeometry.CGPoint
#else
import struct CoreGraphics.CGFloat
import struct CoreGraphics.CGPoint
#endif

public extension CGPoint {
	@_transparent
	var indices: Range<Int> {
		return 0..<2
	}
	
	subscript(index: Int) -> CGFloat {
		switch index {
		case 0: return x
		case 1: return y
		default:
			fatalError("Array index out of range")
		}
	}
	
	@inlinable
	static var unitX: CGPoint {
		return CGPoint(x: 1.0, y: 0.0)
	}
	
	@inlinable
	static var unitY: CGPoint {
		return CGPoint(x: 0.0, y: 1.0)
	}
}

// MARK: - CGESimdSupport2
extension CGPoint: CGESimd2Support {
	public init(_ value: CGFloat2) {
		self.init(x: CGFloat(value.x), y: CGFloat(value.y))
	}
	
	public var simd: CGFloat2 {
		return CGFloat2(x.native, y.native)
	}
}
