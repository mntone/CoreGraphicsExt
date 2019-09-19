import CoreGraphics

public extension CGImage {
	func resize(to size: CGEInt2Tuple, options: CGEImageConvertOptions = .default) -> CGImage? {
		return resize(to: .init(size), options: options)
	}
	
	// MARK: sRGB
	func sRGB(to size: CGEInt2Tuple, options: CGEImageConvertOptions = .default) -> CGImage? {
		return sRGB(to: .init(size), options: options)
	}
	
	// MARK: Display P3
	@available(iOS 9.3, watchOS 2.3, tvOS 9.3, macOS 10.11.2, *)
	func displayP3(to size: CGEInt2Tuple, options: CGEImageConvertOptions = .default) -> CGImage? {
		return displayP3(to: .init(size), options: options)
	}
	
	// MARK: Adobe RGB
	@available(iOS 9.0, *)
	func adobeRGB(to size: CGEInt2Tuple, options: CGEImageConvertOptions = .default) -> CGImage? {
		return adobeRGB(to: .init(size), options: options)
	}
	
	// MARK: XYZ
	@available(iOS 9.0, macOS 10.11, *)
	func xyz(to size: CGEInt2Tuple, options: CGEImageConvertOptions = .default) -> CGImage? {
		return xyz(to: .init(size), options: options)
	}
	
	// MARK: L*a*b*
	@available(iOS 11.0, watchOS 4.0, tvOS 11.0, macOS 10.13, *)
	func lab(to size: CGEInt2Tuple, options: CGEImageConvertOptions = .default) -> CGImage? {
		return lab(to: .init(size), options: options)
	}
	
	// MARK: Grayscale
	func grayscale(to size: CGEInt2Tuple, options: CGEImageConvertOptions = .default) -> CGImage? {
		return grayscale(to: .init(size), options: options)
	}
}
