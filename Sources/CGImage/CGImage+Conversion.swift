import CoreGraphics

private extension CGImage {
	func context(fromColorSpace colorSpace: CGColorSpace, asSize size: CGEInt2, bitsPerComponent: Int, bitmapInfo: UInt32) -> CGContext? {
		let context = CGContext(data: nil,
								width: size.x,
								height: size.y,
								bitsPerComponent: bitsPerComponent,
								bytesPerRow: 0,
								space: colorSpace,
								bitmapInfo: bitmapInfo)
		return context
	}
	
	func convert(fromColorSpace colorSpaceName: CFString, asSize size: CGEInt2, bitsPerComponent: Int) -> CGImage? {
		guard let colorSpace = CGColorSpace(name: colorSpaceName),
			  let context = self.context(fromColorSpace: colorSpace,
										 asSize: size,
										 bitsPerComponent: bitsPerComponent,
										 bitmapInfo: self.bitmapInfo.rawValue) else { return nil }
		context.draw(self, in: CGRect(x: 0.0, y: 0.0, width: CGFloat(size.x), height: CGFloat(size.y)))
		return context.makeImage()
	}
}

public extension CGImage {
	func resize(to size: CGEInt2, bitsPerComponent: Int? = 8) -> CGImage? {
		guard let colorSpace = self.colorSpace,
			  let context = self.context(fromColorSpace: colorSpace,
										 asSize: size,
										 bitsPerComponent: bitsPerComponent ?? self.bitsPerComponent,
										 bitmapInfo: self.bitmapInfo.rawValue) else { return nil }
		context.draw(self, in: size.cgRect)
		return context.makeImage()
	}
	
	// MARK: sRGB
	var sRGB: CGImage? {
		return sRGB(to: CGEInt2(x: width, y: height))
	}
	
	func sRGB(to size: CGEInt2, bitsPerComponent: Int? = 8) -> CGImage? {
		let colorSpace: CGColorSpace
		if #available(iOS 9.0, *) {
			guard let colorSpace2 = CGColorSpace(name: CGColorSpace.sRGB) else { return nil }
			colorSpace = colorSpace2
		} else {
			colorSpace = CGColorSpaceCreateDeviceRGB()
		}
		
		guard let context = self.context(fromColorSpace: colorSpace,
										 asSize: size,
										 bitsPerComponent: bitsPerComponent ?? self.bitsPerComponent,
										 bitmapInfo: self.bitmapInfo.rawValue) else { return nil }
		context.draw(self, in: size.cgRect)
		return context.makeImage()
	}
	
	// MARK: Display P3
	@available(iOS 9.3, watchOS 2.3, tvOS 9.3, macOS 10.11.2, *)
	var displayP3: CGImage? {
		return displayP3(to: CGEInt2(x: width, y: height))
	}
	
	@available(iOS 9.3, watchOS 2.3, tvOS 9.3, macOS 10.11.2, *)
	func displayP3(to size: CGEInt2, bitsPerComponent: Int? = 8) -> CGImage? {
		return convert(fromColorSpace: CGColorSpace.displayP3,
					   asSize: size,
					   bitsPerComponent: bitsPerComponent ?? self.bitsPerComponent)
	}
	
	// MARK: Adobe RGB
	@available(iOS 9.0, *)
	var adobeRGB: CGImage? {
		return adobeRGB(to: CGEInt2(x: width, y: height))
	}
	
	@available(iOS 9.0, *)
	func adobeRGB(to size: CGEInt2, bitsPerComponent: Int? = 8) -> CGImage? {
		return convert(fromColorSpace: CGColorSpace.adobeRGB1998,
					   asSize: size,
					   bitsPerComponent: bitsPerComponent ?? self.bitsPerComponent)
	}
	
	// MARK: XYZ
	@available(iOS 9.0, macOS 10.11, *)
	var xyz: CGImage? {
		return xyz(to: CGEInt2(x: width, y: height))
	}
	
	@available(iOS 9.0, macOS 10.11, *)
	func xyz(to size: CGEInt2, bitsPerComponent: Int? = 8) -> CGImage? {
		return convert(fromColorSpace: CGColorSpace.genericXYZ,
					   asSize: size,
					   bitsPerComponent: bitsPerComponent ?? self.bitsPerComponent)
	}
	
	// MARK: L*a*b*
	@available(iOS 11.0, tvOS 11.0, macOS 10.13, *)
	var lab: CGImage? {
		return lab(to: CGEInt2(x: width, y: height))
	}
	
	@available(iOS 11.0, tvOS 11.0, macOS 10.13, *)
	func lab(to size: CGEInt2, bitsPerComponent: Int? = 8) -> CGImage? {
		return convert(fromColorSpace: CGColorSpace.genericLab,
					   asSize: size,
					   bitsPerComponent: bitsPerComponent ?? self.bitsPerComponent)
	}
	
	// MARK: Grayscale
	var grayscale: CGImage? {
		return grayscale(to: CGEInt2(x: width, y: height))
	}
	
	func grayscale(to size: CGEInt2, bitsPerComponent: Int? = 8) -> CGImage? {
		let colorSpace: CGColorSpace
		if #available(iOS 9.0, *) {
			guard let colorSpace2 = CGColorSpace(name: CGColorSpace.genericGrayGamma2_2) else { return nil }
			colorSpace = colorSpace2
		} else {
			colorSpace = CGColorSpaceCreateDeviceGray()
		}
		
		guard let context = self.context(fromColorSpace: colorSpace,
										 asSize: size,
										 bitsPerComponent: bitsPerComponent ?? self.bitsPerComponent,
										 bitmapInfo: CGImageAlphaInfo.none.rawValue) else { return nil }
		context.draw(self, in: size.cgRect)
		return context.makeImage()
	}
}
