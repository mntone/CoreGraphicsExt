import CoreGraphics
import Foundation
import ImageIO

#if os(macOS)
import CoreServices
#else
import MobileCoreServices
#endif

public enum CGETiffCompression: Int {
	case none = 1
	case ccittFAX3 = 3
	case ccittFAX4 = 4
	case lzw = 5
	case packBits = 32773
}

public extension CGImage {
	func makeTiff(compressionMode: CGETiffCompression) -> Data? {
		let options: NSDictionary?
		if compressionMode != .none {
			options = [
				kCGImagePropertyTIFFCompression: compressionMode.rawValue,
			]
		} else {
			options = nil
		}
		
		let data = NSMutableData()
		guard let dest = CGImageDestinationCreateWithData(data as CFMutableData, kUTTypeTIFF, 1, nil) else { return nil }
		CGImageDestinationAddImage(dest, self, options)
		CGImageDestinationFinalize(dest)
		return data as Data
	}
}
