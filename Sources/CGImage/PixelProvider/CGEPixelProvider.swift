import CoreGraphics

public protocol CGEPixelProvider {
	var width: Int { get }
	var height: Int { get }
	var numberOfComponents: Int { get }
	var bytePerRow: Int { get }
	
	var alphaInfo: CGImageAlphaInfo { get }
	var byteOrderInfo: CGImageByteOrderInfo { get }
	
	var length: Int { get }
	var pixelProvider: (Int) -> [UInt8] { get }
}
