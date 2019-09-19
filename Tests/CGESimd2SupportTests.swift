@testable import CoreGraphicsExt
import XCTest

struct CGVirtual2Object: Hashable, CGESimd2Support {
	let a: CGFloat
	let b: CGFloat
	
	init(a: CGFloat, b: CGFloat) {
		self.a = a
		self.b = b
	}
	
	init(_ value: CGFloat2) {
		self.a = CGFloat(value.x)
		self.b = CGFloat(value.y)
	}
	
	var simd: CGFloat2 {
		return CGFloat2(x: a.native, y: b.native)
	}
}

final class CGESimd2SupportTests: XCTestCase {
	private let left = CGVirtual2Object(a: 4.0, b: 5.0)
	private let right = CGVirtual2Object(a: 3.0, b: 2.0)
	
	// --- [ Defines ] ------
	func testCGESIMD2_Defines_One() {
		let expected = CGVirtual2Object(a: 1.0, b: 1.0)
		XCTAssertEqual(expected, .one)
	}
	
	// --- [ Functions ] ------
	func testCGESIMD2_Functions_AbsPlusPlus() {
		let value = CGVirtual2Object(a: 4.0, b: 5.0)
		let expected = CGVirtual2Object(a: 4.0, b: 5.0)
		XCTAssertEqual(expected, abs(value))
	}
	
	func testCGESIMD2_Functions_AbsPlusMinus() {
		let value = CGVirtual2Object(a: 4.0, b: -5.0)
		let expected = CGVirtual2Object(a: 4.0, b: 5.0)
		XCTAssertEqual(expected, abs(value))
	}
	
	func testCGESIMD2_Functions_AbsMinusPlus() {
		let value = CGVirtual2Object(a: -4.0, b: 5.0)
		let expected = CGVirtual2Object(a: 4.0, b: 5.0)
		XCTAssertEqual(expected, abs(value))
	}
	
	func testCGESIMD2_Functions_AbsMinusMinus() {
		let value = CGVirtual2Object(a: -4.0, b: -5.0)
		let expected = CGVirtual2Object(a: 4.0, b: 5.0)
		XCTAssertEqual(expected, abs(value))
	}
	
	func testCGESIMD2_Functions_Ceil() {
		let value = CGVirtual2Object(a: 4.5, b: 5.3)
		let expected = CGVirtual2Object(a: 5.0, b: 6.0)
		XCTAssertEqual(expected, ceil(value))
	}
	
	func testCGESIMD2_Functions_CeilMinus() {
		let value = CGVirtual2Object(a: -4.5, b: -5.3)
		let expected = CGVirtual2Object(a: -4.0, b: -5.0)
		XCTAssertEqual(expected, ceil(value))
	}
	
	func testCGESIMD2_Functions_Floor() {
		let value = CGVirtual2Object(a: 4.5, b: 5.3)
		let expected = CGVirtual2Object(a: 4.0, b: 5.0)
		XCTAssertEqual(expected, floor(value))
	}
	
	func testCGESIMD2_Functions_FloorMinus() {
		let value = CGVirtual2Object(a: -4.5, b: -5.3)
		let expected = CGVirtual2Object(a: -5.0, b: -6.0)
		XCTAssertEqual(expected, floor(value))
	}
	
	func testCGESIMD2_Functions_Round() {
		let value = CGVirtual2Object(a: 4.5, b: 5.3)
		let expected = CGVirtual2Object(a: 4.0, b: 5.0)
		XCTAssertEqual(expected, trunc(value))
	}
	
	func testCGESIMD2_Functions_RoundMinus() {
		let value = CGVirtual2Object(a: -4.5, b: -5.3)
		let expected = CGVirtual2Object(a: -4.0, b: -5.0)
		XCTAssertEqual(expected, trunc(value))
	}
	
	func testCGESIMD2_Functions_Trunc() {
		let value = CGVirtual2Object(a: 4.5, b: 5.3)
		let expected = CGVirtual2Object(a: 4.0, b: 5.0)
		XCTAssertEqual(expected, trunc(value))
	}
	
	func testCGESIMD2_Functions_TruncMinus() {
		let value = CGVirtual2Object(a: -4.5, b: -5.3)
		let expected = CGVirtual2Object(a: -4.0, b: -5.0)
		XCTAssertEqual(expected, trunc(value))
	}
	
	func testCGESIMD2_Functions_Max() {
		let expected = CGVirtual2Object(a: 4.0, b: 5.0)
		XCTAssertEqual(expected, max(left, right))
	}
	
	func testCGESIMD2_Functions_Min() {
		let expected = CGVirtual2Object(a: 3.0, b: 2.0)
		XCTAssertEqual(expected, min(left, right))
	}
	
	func testCGESIMD2_Functions_ReduceAdd() {
		let expected: CGFloat = 9.0
		XCTAssertEqual(expected, reduce_add(left))
	}
	
	func testCGESIMD2_Functions_ReduceMax() {
		let expected: CGFloat = 5.0
		XCTAssertEqual(expected, reduce_max(left))
	}
	
	func testCGESIMD2_Functions_ReduceMin() {
		let expected: CGFloat = 4.0
		XCTAssertEqual(expected, reduce_min(left))
	}
	
	func testCGESIMD2_Functions_Clamp() {
		let expected = CGVirtual2Object(a: 4.3, b: 4.7)
		XCTAssertEqual(expected, clamp(left, min: 4.3, max: 4.7))
	}
	
	func testCGESIMD2_Functions_Length() {
		let expected: CGFloat = sqrt(41.0)
		XCTAssertEqual(expected, length(left))
	}
	
	func testCGESIMD2_Functions_LengthSquared() {
		let expected: CGFloat = 41.0
		XCTAssertEqual(expected, length_squared(left))
	}
	
	func testCGESIMD2_Functions_Distance() {
		let expected: CGFloat = sqrt(10.0)
		XCTAssertEqual(expected, distance(left, right))
	}
	
	func testCGESIMD2_Functions_DistanceSquared() {
		let expected: CGFloat = 10.0
		XCTAssertEqual(expected, distance_squared(left, right))
	}
	
	// --- [ Operators: ?V ] ------
	func testCGESIMD2_Operators_Negative() {
		let expected = CGVirtual2Object(a: -4.0, b: -5.0)
		XCTAssertEqual(expected, -left)
	}
	
	// --- [ Operators: V ? V ] ------
	func testCGESIMD2_Operators_Add() {
		let expected = CGVirtual2Object(a: 7.0, b: 7.0)
		XCTAssertEqual(expected, left + right)
	}
	
	func testCGESIMD2_Operators_Sub() {
		let expected = CGVirtual2Object(a: 1.0, b: 3.0)
		XCTAssertEqual(expected, left - right)
	}
	
	func testCGESIMD2_Operators_Mul() {
		let expected = CGVirtual2Object(a: 12.0, b: 10.0)
		XCTAssertEqual(expected, left * right)
	}
	
	func testCGESIMD2_Operators_Dev() {
		let expected = CGVirtual2Object(a: 4.0 / 3.0, b: 2.5)
		XCTAssertEqual(expected, left / right)
	}
	
	// --- [ Operators: C ? V ] ------
	func testCGESIMD2_Operators_AddLeftConst() {
		let expected = CGVirtual2Object(a: 7.0, b: 8.0)
		XCTAssertEqual(expected, 3.0 + left)
	}
	
	func testCGESIMD2_Operators_SubLeftConst() {
		let expected = CGVirtual2Object(a: -1.0, b: -2.0)
		XCTAssertEqual(expected, 3.0 - left)
	}
	
	func testCGESIMD2_Operators_MulLeftConst() {
		let expected = CGVirtual2Object(a: 12.0, b: 15.0)
		XCTAssertEqual(expected, 3.0 * left)
	}
	
	func testCGESIMD2_Operators_DevLeftConst() {
		let expected = CGVirtual2Object(a: 3.0 / 4.0, b: 3.0 / 5.0)
		XCTAssertEqual(expected, 3.0 / left)
	}
	
	// --- [ Operators: V ? C ] ------
	func testCGESIMD2_Operators_AddRightConst() {
		let expected = CGVirtual2Object(a: 7.0, b: 8.0)
		XCTAssertEqual(expected, left + 3.0)
	}
	
	func testCGESIMD2_Operators_SubRightConst() {
		let expected = CGVirtual2Object(a: 1.0, b: 2.0)
		XCTAssertEqual(expected, left - 3.0)
	}
	
	func testCGESIMD2_Operators_MulRightConst() {
		let expected = CGVirtual2Object(a: 12.0, b: 15.0)
		XCTAssertEqual(expected, left * 3.0)
	}
	
	func testCGESIMD2_Operators_DevRightConst() {
		let expected = CGVirtual2Object(a: 4.0 / 3.0, b: 5.0 / 3.0)
		XCTAssertEqual(expected, left / 3.0)
	}
	
	// --- [ Operators: V ?= V ] ------
	func testCGESIMD2_Operators_AddAsg() {
		var temp = left
		temp += right
		
		let expected = CGVirtual2Object(a: 7.0, b: 7.0)
		XCTAssertEqual(expected, temp)
	}
	
	func testCGESIMD2_Operators_SubAsg() {
		var temp = left
		temp -= right
		
		let expected = CGVirtual2Object(a: 1.0, b: 3.0)
		XCTAssertEqual(expected, temp)
	}
	
	func testCGESIMD2_Operators_MulAsg() {
		var temp = left
		temp *= right
		
		let expected = CGVirtual2Object(a: 12.0, b: 10.0)
		XCTAssertEqual(expected, temp)
	}
	
	func testCGESIMD2_Operators_DevAsg() {
		var temp = left
		temp /= right
		
		let expected = CGVirtual2Object(a: 4.0 / 3.0, b: 2.5)
		XCTAssertEqual(expected, temp)
	}
	
	// --- [ Operators: V ?= C ] ------
	func testCGESIMD2_Operators_AddConstAsg() {
		var temp = left
		temp += 3.0
		
		let expected = CGVirtual2Object(a: 7.0, b: 8.0)
		XCTAssertEqual(expected, temp)
	}
	
	func testCGESIMD2_Operators_SubConstAsg() {
		var temp = left
		temp -= 3.0
		
		let expected = CGVirtual2Object(a: 1.0, b: 2.0)
		XCTAssertEqual(expected, temp)
	}
	
	func testCGESIMD2_Operators_MulConstAsg() {
		var temp = left
		temp *= 3.0
		
		let expected = CGVirtual2Object(a: 12.0, b: 15.0)
		XCTAssertEqual(expected, temp)
	}
	
	func testCGESIMD2_Operators_DevConstAsg() {
		var temp = left
		temp /= 3.0
		
		let expected = CGVirtual2Object(a: 4.0 / 3.0, b: 5.0 / 3.0)
		XCTAssertEqual(expected, temp)
	}
}
