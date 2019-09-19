import simd

public protocol CGESimdSupport {
	associatedtype SimdType: SIMD
	
	init(_ value: SimdType)
	
	var simd: SimdType { get }
}
