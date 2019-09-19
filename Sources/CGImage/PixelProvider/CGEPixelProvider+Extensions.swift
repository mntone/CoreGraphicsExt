#if canImport(UIKit)
import struct UIKit.UIEdgeInsets

public typealias CGEEdgeInsets = UIEdgeInsets
#elseif canImport(AppKit)
import struct AppKit.NSEdgeInsets

public typealias CGEEdgeInsets = NSEdgeInsets
#else
public struct CGEEdgeInsets {
	public let top: CGFloat
	public let left: CGFloat
	public let bottom: CGFloat
	public let right: CGFloat
}
#endif

public extension CGEPixelProvider {
	var pixels: [[UInt8]] {
		return (0..<length).map { pixelProvider($0) }
	}
	
	func pixels(onEdge edgeInsets: CGEEdgeInsets = CGEEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)) -> [[UInt8]] {
		let leftEdgeInt = Int(edgeInsets.left)
		let rightEdgeInt = Int(edgeInsets.right)
		if leftEdgeInt + rightEdgeInt > width {
			return self.pixels
		}
		
		let topEdgeInt = Int(edgeInsets.top)
		let bottomEdgeInt = Int(edgeInsets.bottom)
		
		let topPixelCount = topEdgeInt * width
		let bottomPixelCount = height * bottomEdgeInt
		
		let leftHeight = height - (topEdgeInt + bottomEdgeInt)
		let capacity = topPixelCount + leftHeight * (leftEdgeInt + rightEdgeInt) + bottomPixelCount
		
		var edgePixels: [[UInt8]] = []
		edgePixels.reserveCapacity(capacity)
		
		// Top pixels
		let topPixels = (0..<topPixelCount).map { pixelProvider($0) }
		edgePixels.append(contentsOf: topPixels)
		
		// Middle pixels
		for offsetIndex in stride(from: topPixelCount, to: topPixelCount + leftHeight * width, by: width) {
			// Left pixels
			let leftPixelsOnStride = (offsetIndex..<offsetIndex + leftEdgeInt).map { pixelProvider($0) }
			edgePixels.append(contentsOf: leftPixelsOnStride)
			
			// Right pixels
			let rightOffsetIndex = offsetIndex + width - rightEdgeInt
			let rightPixelsOnStride = (rightOffsetIndex..<rightOffsetIndex + rightEdgeInt).map { pixelProvider($0) }
			edgePixels.append(contentsOf: rightPixelsOnStride)
		}
		
		// Bottom pixels
		let bottomStartIndex = height * (width - bottomEdgeInt)
		let bottomPixels = (bottomStartIndex..<bottomStartIndex + bottomPixelCount).map { pixelProvider($0) }
		edgePixels.append(contentsOf: bottomPixels)
		
		return edgePixels
	}
	
	func ratioAll(condition: ([UInt8]) -> Bool) -> Float {
		var hitPixels = 0
		let pixels = self.pixels
		for pixels in pixels {
			if condition(pixels) {
				hitPixels += 1
			}
		}
		return Float32(hitPixels) / Float32(pixels.count)
	}
	
	func ratio(onEdge edgeInsets: CGEEdgeInsets = CGEEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0),
			   condition: ([UInt8]) -> Bool) -> Float {
		var hitPixels = 0
		let pixels = self.pixels(onEdge: edgeInsets)
		for pixel in pixels {
			if condition(pixel) {
				hitPixels += 1
			}
		}
		return Float32(hitPixels) / Float32(pixels.count)
	}
}
