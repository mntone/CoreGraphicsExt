import CoreGraphics

private func getPixelProvider(_ image: CGImage) -> CGEPixelProvider {
	guard let pixelProvider = CGEImagePixelProvider(image) else {
		fatalError()
	}
	return pixelProvider
}

public extension CGImage {
	var numberOfComponents: Int {
		return bitsPerPixel / bitsPerComponent
	}
	
	var pixelProvider: CGEPixelProvider {
		if #available(iOS 10.0, watchOS 3.0, tvOS 10.0, macOS 10.12, *) {
			if #available(iOS 13.0, watchOS 6.0, tvOS 13.0, macOS 10.15, *) {
				if let colorSpace = colorSpace, (colorSpace.isWideGamutRGB || colorSpace.isHDR()) {
					guard let sRGBImage = self.sRGB else { fatalError() }
					return getPixelProvider(sRGBImage)
				}
			} else {
				if let colorSpace = colorSpace, colorSpace.isWideGamutRGB {
					guard let sRGBImage = self.sRGB else { fatalError() }
					return getPixelProvider(sRGBImage)
				}
			}
		}
		
		if bitsPerComponent != 8 {
			guard let sRGBImage = self.sRGB else { fatalError() }
			return getPixelProvider(sRGBImage)
		}
		
		return getPixelProvider(self)
	}
}
