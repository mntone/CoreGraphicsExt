import CoreGraphics

struct CGEImagePixelProvider: CGEPixelProvider {
	public let image: CGImage
	public let numberOfComponents: Int
	public let length: Int
	public let pixelProvider: (Int) -> [UInt8]
	
	private let imageData: CFData
	
	init?(_ image: CGImage) {
		assert(image.bitsPerComponent == 8)
		self.image = image
		
		let components = image.numberOfComponents
		self.numberOfComponents = components
		
		guard let imageData = image.dataProvider?.data else {
			return nil
		}
		self.imageData = imageData
		
		let length = CFDataGetLength(imageData)
		self.length = length
		
		let ptr = CFDataGetBytePtr(imageData)!
		self.pixelProvider = { index in
			let offset = components * index
			let pixels: [UInt8] = Array(UnsafeBufferPointer(start: ptr + offset, count: components))
			return pixels
		}
	}
	
	@inlinable
	public var width: Int {
		return image.width
	}
	
	@inlinable
	public var height: Int {
		return image.height
	}
	
	@inlinable
	public var bytePerRow: Int {
		return image.bytesPerRow
	}
	
	@inlinable
	public var alphaInfo: CGImageAlphaInfo {
		return CGImageAlphaInfo(rawValue: CGBitmapInfo.alphaInfoMask.rawValue & image.bitmapInfo.rawValue)!
	}
	
	@inlinable
	public var byteOrderInfo: CGImageByteOrderInfo {
		return CGImageByteOrderInfo(rawValue: CGBitmapInfo.byteOrderMask.rawValue & image.bitmapInfo.rawValue)!
	}
}
