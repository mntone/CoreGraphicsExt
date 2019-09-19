
func rgbToHSV<IntegerType: UnsignedInteger>(_ red: IntegerType, _ green: IntegerType, _ blue: IntegerType) -> (hue: IntegerType, saturation: IntegerType, brightness: IntegerType) {
	let minValue = min(red, green, blue)
	
	let diffFloat: Float
	let brightness: IntegerType
	var hueFloat: Float
	if red > green {
		if red > blue {
			brightness = red
			
			diffFloat = Float(brightness - minValue)
			hueFloat = Float(42.5) * Float(Int32(green) - Int32(blue)) / diffFloat
		} else {
			brightness = blue
			
			diffFloat = Float(brightness - minValue)
			hueFloat = Float(42.5) * (Float(2) + (Float(Int32(red) - Int32(green)) / diffFloat))
		}
	} else if green > blue {
		brightness = green
		
		diffFloat = Float(brightness - minValue)
		hueFloat = Float32(42.5) * (Float(4) + (Float(Int32(blue) - Int32(red)) / diffFloat))
	} else {
		brightness = blue
		
		let diff = brightness - minValue
		diffFloat = Float32(diff)
		if diff == 0 {
			hueFloat = 0.0
		} else {
			hueFloat = Float(42.5) * (Float(2) + (Float(Int32(red) - Int32(green)) / diffFloat))
		}
	}
	
	if hueFloat < 0.0 {
		hueFloat += 255.0
	}
	let hue = IntegerType(hueFloat)
	
	let saturation = brightness != 0 ? IntegerType((255 * diffFloat) / Float(brightness)) : 0
	return (hue, saturation, brightness)
}

extension CGEPixelProvider {
	var toHSV: CGEPixelProvider {
		switch alphaInfo {
		case .none, .noneSkipLast, .noneSkipFirst:
			return CGEConvertingPixelProvider(self) { pixels in
				let red = pixels[0]
				let green = pixels[1]
				let blue = pixels[2]
				let (hue, saturation, brightness) = rgbToHSV(red, green, blue)

				var output: [UInt8] = Array(repeating: 0, count: 3)
				output[0] = hue
				output[1] = saturation
				output[2] = brightness
				return output
			}
			
		case .premultipliedLast, .last, .premultipliedFirst, .first:
			return CGEConvertingPixelProvider(self) { pixels in
				let red = pixels[0]
				let green = pixels[1]
				let blue = pixels[2]
				let (hue, saturation, brightness) = rgbToHSV(red, green, blue)
				
				var output: [UInt8] = Array(repeating: 0, count: 4)
				output[0] = hue
				output[1] = saturation
				output[2] = brightness
				output[3] = pixels[3]
				return output
			}
			
		default:
			fatalError()
		}
	}
}
