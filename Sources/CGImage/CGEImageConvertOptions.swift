import CoreGraphics

public struct CGEImageConvertOptions {
	public var alphaInfo: CGImageAlphaInfo? = .premultipliedLast
	public var byteOrderInfo: CGImageByteOrderInfo? = .orderDefault
	
	public static let `default` = CGEImageConvertOptions()
	public static let preserveAlphaOnly = CGEImageConvertOptions(alphaInfo: nil, byteOrderInfo: .orderDefault)
	public static let preserve = CGEImageConvertOptions(alphaInfo: nil, byteOrderInfo: nil)
}

extension CGEImageConvertOptions {
	func getBitmapInfoValue(_ image: CGImage) -> UInt32 {
		let alphaInfoValue: UInt32
		if let alphaInfo = self.alphaInfo {
			alphaInfoValue = alphaInfo.rawValue
		} else {
			alphaInfoValue = CGBitmapInfo.alphaInfoMask.rawValue & image.bitmapInfo.rawValue
		}
		
		let byteOrderInfoValue: UInt32
		if let byteOrderInfo = self.byteOrderInfo {
			byteOrderInfoValue = byteOrderInfo.rawValue
		} else {
			byteOrderInfoValue = CGBitmapInfo.byteOrderMask.rawValue & image.bitmapInfo.rawValue
		}
		
		return alphaInfoValue | byteOrderInfoValue
	}
	
	func getBitsPerComponent(_ image: CGImage) -> Int {
		guard let byteOrderInfo = self.byteOrderInfo else {
			return image.bitsPerComponent
		}
		
		switch byteOrderInfo {
		case .order16Big, .order16Little:
			return 16
			
		case .order32Big, .order32Little:
			return 32
			
		default:
			return 8
		}
	}
}
