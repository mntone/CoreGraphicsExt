import CoreGraphics

private func needNormalize(_ alphaInfo: CGImageAlphaInfo) -> Bool {
	switch alphaInfo {
	case .premultipliedFirst, .first, .noneSkipLast, .noneSkipFirst:
		return true
		
	default:
		return false
	}
}

public struct CGEConvertingPixelProvider: CGEPixelProvider {
	public let pixelProvider: (Int) -> [UInt8]
	
	private let provider: CGEPixelProvider
	
	init(_ provider: CGEPixelProvider, convertHandler: @escaping ([UInt8]) -> [UInt8]) {
		if needNormalize(provider.alphaInfo) {
			self.provider = CGENormalizePixelProvider(provider)
		} else {
			self.provider = provider
		}
		self.pixelProvider = { pixels in
			convertHandler(provider.pixelProvider(pixels))
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
	
	public var alphaInfo: CGImageAlphaInfo {
		return provider.alphaInfo
	}
	
	public var byteOrderInfo: CGImageByteOrderInfo {
		return provider.byteOrderInfo
	}
	
	public var length: Int {
		return provider.length
	}
}
