import CoreGraphics

public struct CGEInt2 {
	public let x: Int
	public let y: Int
}

extension CGEInt2 {
	var cgRect: CGRect {
		return CGRect(x: 0, y: 0, width: self.x, height: self.y)
	}
}

public typealias CGEInt2Tuple = (Int, Int)

extension CGEInt2 {
	init(_ tupleValue: CGEInt2Tuple) {
		self.x = tupleValue.0
		self.y = tupleValue.1
	}
}
