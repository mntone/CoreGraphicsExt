import CoreGraphics

private func getSwapAandRGBFunction(_ provider: CGEPixelProvider) -> ((Int) -> [UInt8]) {
	return { pixels in
		var convertedPixels = provider.pixelProvider(pixels)
		convertedPixels.withUnsafeMutableBufferPointer { buffer in
			let alpha = buffer[0]
			buffer[0] = buffer[1] // Red
			buffer[1] = buffer[2] // Green
			buffer[2] = buffer[3] // Blue
			buffer[3] = alpha
		}
		return convertedPixels
	}
}

struct CGENormalizePixelProvider: CGEPixelProvider {
	public let alphaInfo: CGImageAlphaInfo
	public let pixelProvider: (Int) -> [UInt8]
	
	private let provider: CGEPixelProvider
	
	init(_ provider: CGEPixelProvider) {
		self.provider = provider
		
		let currentAlphaInfo = provider.alphaInfo
		switch currentAlphaInfo {
		case .none, .premultipliedLast, .last:
			self.alphaInfo = currentAlphaInfo
			self.pixelProvider = provider.pixelProvider
			
		case .premultipliedFirst:
			self.alphaInfo = .premultipliedLast
			self.pixelProvider = getSwapAandRGBFunction(provider)
			
		case .first:
			self.alphaInfo = .last
			self.pixelProvider = getSwapAandRGBFunction(provider)
			
		case .noneSkipLast:
			self.alphaInfo = .none
			self.pixelProvider = { pixels in
				Array(provider.pixelProvider(pixels)[0..<2])
			}
			
		case .noneSkipFirst:
			self.alphaInfo = .none
			self.pixelProvider = { pixels in
				Array(provider.pixelProvider(pixels)[1..<3])
			}
			
		default:
			fatalError()
		}
	}
	
	public var width: Int {
		return provider.width
	}
	
	public var height: Int {
		return provider.height
	}
	
	public var bytePerRow: Int {
		return provider.bytePerRow
	}
	
	public var numberOfComponents: Int {
		return provider.numberOfComponents
	}
	
	public var byteOrderInfo: CGImageByteOrderInfo {
		return provider.byteOrderInfo
	}
	
	public var length: Int {
		return provider.length
	}
}
