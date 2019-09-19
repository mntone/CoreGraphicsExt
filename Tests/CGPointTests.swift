@testable import CoreGraphicsExt
import XCTest

private typealias CGTarget = CGPoint

extension CGTarget {
	fileprivate init(a: CGFloat, b: CGFloat) {
		self.init(x: a, y: b)
	}
}

final class CGPointTests: XCTestCase {
	private let left = CGTarget(a: 4.0, b: 5.0)
	private let right = CGTarget(a: 3.0, b: 2.0)
	
	// --- [ Operators: V ? V ] ------
	func testCGPoint_Operators_AddSub() {
		let expected = CGTarget(a: 7.0, b: 3.0)
		XCTAssertEqual(expected, left +- right)
	}
	
	func testCGPoint_Operators_SubAdd() {
		let expected = CGTarget(a: 1.0, b: 7.0)
		XCTAssertEqual(expected, left -+ right)
	}
	
	// --- [ Operators: C ? V ] ------
	func testCGPoint_Operators_AddSubLeftConst() {
		let expected = CGTarget(a: 7.0, b: -2.0)
		XCTAssertEqual(expected, 3.0 +- left)
	}
	
	func testCGPoint_Operators_SubAddLeftConst() {
		let expected = CGTarget(a: -1.0, b: 8.0)
		XCTAssertEqual(expected, 3.0 -+ left)
	}
	
	// --- [ Operators: V ? C ] ------
	func testCGPoint_Operators_AddSubRightConst() {
		let expected = CGTarget(a: 7.0, b: 2.0)
		XCTAssertEqual(expected, left +- 3.0)
	}
	
	func testCGPoint_Operators_SubAddRightConst() {
		let expected = CGTarget(a: 1.0, b: 8.0)
		XCTAssertEqual(expected, left -+ 3.0)
	}
	
	// --- [ Operators: V ?= V ] ------
	func testCGPoint_Operators_AddSubAsg() {
		var temp = left
		temp +-= right
		
		let expected = CGTarget(a: 7.0, b: 3.0)
		XCTAssertEqual(expected, temp)
	}
	
	func testCGPoint_Operators_SubAddAsg() {
		var temp = left
		temp -+= right
		
		let expected = CGTarget(a: 1.0, b: 7.0)
		XCTAssertEqual(expected, temp)
	}
	
	// --- [ Operators: V ?= C ] ------
	func testCGPoint_Operators_AddSubConstAsg() {
		var temp = left
		temp +-= 3.0
		
		let expected = CGTarget(a: 7.0, b: 2.0)
		XCTAssertEqual(expected, temp)
	}
	
	func testCGPoint_Operators_SubAddConstAsg() {
		var temp = left
		temp -+= 3.0
		
		let expected = CGTarget(a: 1.0, b: 8.0)
		XCTAssertEqual(expected, temp)
	}
}
