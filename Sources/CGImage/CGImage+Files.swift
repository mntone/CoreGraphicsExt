import CoreGraphics
import Foundation
import ImageIO

#if os(macOS)
import CoreServices
#else
import MobileCoreServices
#endif

public extension CGImage {
	func makeGif() -> Data? {
		let data = NSMutableData()
		guard let dest = CGImageDestinationCreateWithData(data as CFMutableData, kUTTypeGIF, 1, nil) else { return nil }
		CGImageDestinationAddImage(dest, self, nil)
		CGImageDestinationFinalize(dest)
		return data as Data
	}
	
	func makePng() -> Data? {
		let data = NSMutableData()
		guard let dest = CGImageDestinationCreateWithData(data as CFMutableData, kUTTypePNG, 1, nil) else { return nil }
		CGImageDestinationAddImage(dest, self, nil)
		CGImageDestinationFinalize(dest)
		return data as Data
	}
}
