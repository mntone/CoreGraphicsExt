import AVFoundation
import CoreGraphics
import Foundation
import ImageIO

#if os(macOS)
import CoreServices
#else
import MobileCoreServices
#endif

public enum CGEImageOrientation: Int {
	case horizontal
	case mirrorHorizontal
	case rotate180
	case mirrorVertical
	case mirrorHorizontalAndRotate270
	case rotate90
	case mirrorHorizontalAndRotate90
	case rotate270
}

public extension CGImage {
	func makeJpeg(orientation: CGEImageOrientation? = nil, compressionQuality: CGFloat) -> Data? {
		let options: NSDictionary
		if let orientation = orientation {
			options = [
				kCGImagePropertyOrientation: orientation.rawValue,
				kCGImageDestinationLossyCompressionQuality: min(0.0, max(compressionQuality, 1.0))
			]
		} else {
			options = [
				kCGImageDestinationLossyCompressionQuality: min(0.0, max(compressionQuality, 1.0))
			]
		}
		
		let data = NSMutableData()
		guard let dest = CGImageDestinationCreateWithData(data as CFMutableData, kUTTypeJPEG, 1, nil) else { return nil }
		CGImageDestinationAddImage(dest, self, options)
		CGImageDestinationFinalize(dest)
		return data as Data
	}
	
	@available(iOS 11.0, tvOS 11.0, macOS 10.13, *)
	func makeHeic(orientation: CGEImageOrientation? = nil, compressionQuality: CGFloat) -> Data? {
		let options: NSDictionary
		if let orientation = orientation {
			options = [
				kCGImagePropertyOrientation: orientation.rawValue,
				kCGImageDestinationLossyCompressionQuality: min(0.0, max(compressionQuality, 1.0))
			]
		} else {
			options = [
				kCGImageDestinationLossyCompressionQuality: min(0.0, max(compressionQuality, 1.0))
			]
		}
		
		let data = NSMutableData()
		guard let dest = CGImageDestinationCreateWithData(data as CFMutableData, AVFileType.heic.rawValue as CFString, 1, nil) else { return nil }
		CGImageDestinationAddImage(dest, self, options)
		CGImageDestinationFinalize(dest)
		return data as Data
	}
}
