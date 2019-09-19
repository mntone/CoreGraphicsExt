@testable import CoreGraphicsExt
import XCTest

struct CGVirtual4Object: Hashable, CGESimd4Support {
	let a: CGFloat
	let b: CGFloat
	let c: CGFloat
	let d: CGFloat
	
	init(a: CGFloat, b: CGFloat, c: CGFloat, d: CGFloat) {
		self.a = a
		self.b = b
		self.c = c
		self.d = d
	}
	
	init(_ value: CGFloat4) {
		self.a = CGFloat(value.x)
		self.b = CGFloat(value.y)
		self.c = CGFloat(value.z)
		self.d = CGFloat(value.w)
	}
	
	var simd: CGFloat4 {
		return CGFloat4(x: a.native, y: b.native, z: c.native, w: d.native)
	}
}

final class CGESimd4SupportTests: XCTestCase {
	private let left = CGVirtual4Object(a: 4.0, b: 5.0, c: 6.0, d: 7.0)
	private let right = CGVirtual4Object(a: 3.0, b: 2.0, c: 1.0, d: 0.0)
	
	// --- [ Defines ] ------
	func testCGESIMD4_Defines_One() {
		let expected = CGVirtual4Object(a: 1.0, b: 1.0, c: 1.0, d: 1.0)
		XCTAssertEqual(expected, .one)
	}
	
	// --- [ Functions ] ------
	func testCGESIMD4_Functions_AbsPlusPlus() {
		let value = CGVirtual4Object(a: 4.0, b: 5.0, c: 6.0, d: 7.0)
		let expected = CGVirtual4Object(a: 4.0, b: 5.0, c: 6.0, d: 7.0)
		XCTAssertEqual(expected, abs(value))
	}
	
	func testCGESIMD4_Functions_AbsPlusMinus() {
		let value = CGVirtual4Object(a: 4.0, b: -5.0, c: 6.0, d: -7.0)
		let expected = CGVirtual4Object(a: 4.0, b: 5.0, c: 6.0, d: 7.0)
		XCTAssertEqual(expected, abs(value))
	}
	
	func testCGESIMD4_Functions_AbsMinusPlus() {
		let value = CGVirtual4Object(a: -4.0, b: 5.0, c: -6.0, d: 7.0)
		let expected = CGVirtual4Object(a: 4.0, b: 5.0, c: 6.0, d: 7.0)
		XCTAssertEqual(expected, abs(value))
	}
	
	func testCGESIMD4_Functions_AbsMinusMinus() {
		let value = CGVirtual4Object(a: -4.0, b: -5.0, c: -6.0, d: -7.0)
		let expected = CGVirtual4Object(a: 4.0, b: 5.0, c: 6.0, d: 7.0)
		XCTAssertEqual(expected, abs(value))
	}
	
	func testCGESIMD4_Functions_Ceil() {
		let value = CGVirtual4Object(a: 4.5, b: 5.3, c: 6.7, d: 7.2)
		let expected = CGVirtual4Object(a: 5.0, b: 6.0, c: 7.0, d: 8.0)
		XCTAssertEqual(expected, ceil(value))
	}
	
	func testCGESIMD4_Functions_CeilMinus() {
		let value = CGVirtual4Object(a: -4.5, b: -5.3, c: -6.7, d: -7.2)
		let expected = CGVirtual4Object(a: -4.0, b: -5.0, c: -6.0, d: -7.0)
		XCTAssertEqual(expected, ceil(value))
	}
	
	func testCGESIMD4_Functions_Floor() {
		let value = CGVirtual4Object(a: 4.5, b: 5.3, c: 6.7, d: 7.2)
		let expected = CGVirtual4Object(a: 4.0, b: 5.0, c: 6.0, d: 7.0)
		XCTAssertEqual(expected, floor(value))
	}
	
	func testCGESIMD4_Functions_FloorMinus() {
		let value = CGVirtual4Object(a: -4.5, b: -5.3, c: -6.7, d: -7.2)
		let expected = CGVirtual4Object(a: -5.0, b: -6.0, c: -7.0, d: -8.0)
		XCTAssertEqual(expected, floor(value))
	}
	
	func testCGESIMD4_Functions_Round() {
		let value = CGVirtual4Object(a: 4.5, b: 5.3, c: 6.7, d: 7.2)
		let expected = CGVirtual4Object(a: 4.0, b: 5.0, c: 6.0, d: 7.0)
		XCTAssertEqual(expected, trunc(value))
	}
	
	func testCGESIMD4_Functions_RoundMinus() {
		let value = CGVirtual4Object(a: -4.5, b: -5.3, c: -6.7, d: -7.2)
		let expected = CGVirtual4Object(a: -4.0, b: -5.0, c: -6.0, d: -7.0)
		XCTAssertEqual(expected, trunc(value))
	}
	
	func testCGESIMD4_Functions_Trunc() {
		let value = CGVirtual4Object(a: 4.5, b: 5.3, c: 6.7, d: 7.2)
		let expected = CGVirtual4Object(a: 4.0, b: 5.0, c: 6.0, d: 7.0)
		XCTAssertEqual(expected, trunc(value))
	}
	
	func testCGESIMD4_Functions_TruncMinus() {
		let value = CGVirtual4Object(a: -4.5, b: -5.3, c: -6.7, d: -7.2)
		let expected = CGVirtual4Object(a: -4.0, b: -5.0, c: -6.0, d: -7.0)
		XCTAssertEqual(expected, trunc(value))
	}
	
	func testCGESIMD4_Functions_Max() {
		let expected = CGVirtual4Object(a: 4.0, b: 5.0, c: 6.0, d: 7.0)
		XCTAssertEqual(expected, max(left, right))
	}
	
	func testCGESIMD4_Functions_Min() {
		let expected = CGVirtual4Object(a: 3.0, b: 2.0, c: 1.0, d: 0.0)
		XCTAssertEqual(expected, min(left, right))
	}
	
	func testCGESIMD4_Functions_ReduceAdd() {
		let expected: CGFloat = 22.0
		XCTAssertEqual(expected, reduce_add(left))
	}
	
	func testCGESIMD4_Functions_ReduceMax() {
		let expected: CGFloat = 7.0
		XCTAssertEqual(expected, reduce_max(left))
	}
	
	func testCGESIMD4_Functions_ReduceMin() {
		let expected: CGFloat = 4.0
		XCTAssertEqual(expected, reduce_min(left))
	}
	
	func testCGESIMD4_Functions_Clamp() {
		let expected = CGVirtual4Object(a: 4.3, b: 5.0, c: 6.0, d: 6.7)
		XCTAssertEqual(expected, clamp(left, min: 4.3, max: 6.7))
	}
	
	// --- [ Operators: ?V ] ------
	func testCGESIMD4_Operators_Negative() {
		let expected = CGVirtual4Object(a: -4.0, b: -5.0, c: -6.0, d: -7.0)
		XCTAssertEqual(expected, -left)
	}
	
	// --- [ Operators: V ? V ] ------
	func testCGESIMD4_Operators_Add() {
		let expected = CGVirtual4Object(a: 7.0, b: 7.0, c: 7.0, d: 7.0)
		XCTAssertEqual(expected, left + right)
	}
	
	func testCGESIMD4_Operators_Sub() {
		let expected = CGVirtual4Object(a: 1.0, b: 3.0, c: 5.0, d: 7.0)
		XCTAssertEqual(expected, left - right)
	}
	
	func testCGESIMD4_Operators_Mul() {
		let expected = CGVirtual4Object(a: 12.0, b: 10.0, c: 6.0, d: 0.0)
		XCTAssertEqual(expected, left * right)
	}
	
	func testCGESIMD4_Operators_Dev() {
		let expected = CGVirtual4Object(a: 4.0 / 3.0, b: 2.5, c: 6.0, d: CGFloat.infinity)
		XCTAssertEqual(expected, left / right)
	}
	
	// --- [ Operators: C ? V ] ------
	func testCGESIMD4_Operators_AddLeftConst() {
		let expected = CGVirtual4Object(a: 7.0, b: 8.0, c: 9.0, d: 10.0)
		XCTAssertEqual(expected, 3.0 + left)
	}
	
	func testCGESIMD4_Operators_SubLeftConst() {
		let expected = CGVirtual4Object(a: -1.0, b: -2.0, c: -3.0, d: -4.0)
		XCTAssertEqual(expected, 3.0 - left)
	}
	
	func testCGESIMD4_Operators_MulLeftConst() {
		let expected = CGVirtual4Object(a: 12.0, b: 15.0, c: 18.0, d: 21.0)
		XCTAssertEqual(expected, 3.0 * left)
	}
	
	func testCGESIMD4_Operators_DevLeftConst() {
		let expected = CGVirtual4Object(a: 3.0 / 4.0, b: 3.0 / 5.0, c: 0.5, d: 3.0 / 7.0)
		XCTAssertEqual(expected, 3.0 / left)
	}
	
	// --- [ Operators: V ? C ] ------
	func testCGESIMD4_Operators_AddRightConst() {
		let expected = CGVirtual4Object(a: 7.0, b: 8.0, c: 9.0, d: 10.0)
		XCTAssertEqual(expected, left + 3.0)
	}
	
	func testCGESIMD4_Operators_SubRightConst() {
		let expected = CGVirtual4Object(a: 1.0, b: 2.0, c: 3.0, d: 4.0)
		XCTAssertEqual(expected, left - 3.0)
	}
	
	func testCGESIMD4_Operators_MulRightConst() {
		let expected = CGVirtual4Object(a: 12.0, b: 15.0, c: 18.0, d: 21.0)
		XCTAssertEqual(expected, left * 3.0)
	}
	
	func testCGESIMD4_Operators_DevRightConst() {
		let expected = CGVirtual4Object(a: 4.0 / 3.0, b: 5.0 / 3.0, c: 2.0, d: 7.0 / 3.0)
		XCTAssertEqual(expected, left / 3.0)
	}
	
	// --- [ Operators: V ?= V ] ------
	func testCGESIMD4_Operators_AddAsg() {
		var temp = left
		temp += right
		
		let expected = CGVirtual4Object(a: 7.0, b: 7.0, c: 7.0, d: 7.0)
		XCTAssertEqual(expected, temp)
	}
	
	func testCGESIMD4_Operators_SubAsg() {
		var temp = left
		temp -= right
		
		let expected = CGVirtual4Object(a: 1.0, b: 3.0, c: 5.0, d: 7.0)
		XCTAssertEqual(expected, temp)
	}
	
	func testCGESIMD4_Operators_MulAsg() {
		var temp = left
		temp *= right
		
		let expected = CGVirtual4Object(a: 12.0, b: 10.0, c: 6.0, d: 0.0)
		XCTAssertEqual(expected, temp)
	}
	
	func testCGESIMD4_Operators_DevAsg() {
		var temp = left
		temp /= right
		
		let expected = CGVirtual4Object(a: 4.0 / 3.0, b: 2.5, c: 6.0, d: CGFloat.infinity)
		XCTAssertEqual(expected, temp)
	}
	
	// --- [ Operators: V ?= C ] ------
	func testCGESIMD4_Operators_AddConstAsg() {
		var temp = left
		temp += 3.0
		
		let expected = CGVirtual4Object(a: 7.0, b: 8.0, c: 9.0, d: 10.0)
		XCTAssertEqual(expected, temp)
	}
	
	func testCGESIMD4_Operators_SubConstAsg() {
		var temp = left
		temp -= 3.0
		
		let expected = CGVirtual4Object(a: 1.0, b: 2.0, c: 3.0, d: 4.0)
		XCTAssertEqual(expected, temp)
	}
	
	func testCGESIMD4_Operators_MulConstAsg() {
		var temp = left
		temp *= 3.0
		
		let expected = CGVirtual4Object(a: 12.0, b: 15.0, c: 18.0, d: 21.0)
		XCTAssertEqual(expected, temp)
	}
	
	func testCGESIMD4_Operators_DevConstAsg() {
		var temp = left
		temp /= 3.0
		
		let expected = CGVirtual4Object(a: 4.0 / 3.0, b: 5.0 / 3.0, c: 2.0, d: 7.0 / 3.0)
		XCTAssertEqual(expected, temp)
	}
}
