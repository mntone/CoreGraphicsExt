import simd
#if os(macOS)
import struct CoreGraphics.CGGeometry.CGFloat
#else
import struct CoreGraphics.CGFloat
#endif

/// Elementwise absolute value of a vector.  The result is a vector of the same
/// length with all elements positive.
@inlinable
public func abs<T: CGESimd4Support>(_ x: T) -> T {
	return T(abs(x.simd))
}

/// Each element of the result is the smallest integral value greater than or
/// equal to the corresponding element of the input.
@inlinable
public func ceil<T: CGESimd4Support>(_ x: T) -> T {
	return T(ceil(x.simd))
}

/// Clamp each element of `x` to the range [`min`, max].  If any lane of `x` is
/// NaN, the corresponding lane of the result is `min`.
@inlinable
public func clamp<T: CGESimd4Support>(_ x: T, min: CGFloat, max: CGFloat) -> T {
	return T(clamp(x.simd, min: min.native, max: max.native))
}

/// Distance between `x` and `y`.
@inlinable
public func distance<T: CGESimd4Support>(_ x: T, _ y: T) -> CGFloat {
	return CGFloat(distance(x.simd, y.simd))
}

/// Distance between `x` and `y`, squared.
@inlinable
public func distance_squared<T: CGESimd4Support>(_ x: T, _ y: T) -> CGFloat {
	return CGFloat(distance_squared(x.simd, y.simd))
}

/// Dot product of `x` and `y`.
@inlinable
public func dot<T: CGESimd4Support>(_ x: T, _ y: T) -> CGFloat {
	return CGFloat(dot(x.simd, y.simd))
}

/// Each element of the result is the largest integral value less than or equal
/// to the corresponding element of the input.
@inlinable
public func floor<T: CGESimd4Support>(_ x: T) -> T {
	return T(floor(x.simd))
}

/// Length (two-norm or "Euclidean norm") of `x`.
@inlinable
public func length<T: CGESimd4Support>(_ x: T) -> CGFloat {
	return CGFloat(length(x.simd))
}

/// Length of `x`, squared.
@inlinable
public func length_squared<T: CGESimd4Support>(_ x: T) -> CGFloat {
	return CGFloat(length_squared(x.simd))
}

/// Elementwise maximum of two vectors.  Each component of the result is the
/// larger of the corresponding component of the inputs.
@inlinable
public func max<T: CGESimd4Support>(_ x: T, _ y: T) -> T {
	return T(max(x.simd, y.simd))
}

/// Vector-scalar maximum.  Each component of the result is the maximum of the
/// corresponding element of the input vector and the scalar.
@inlinable
public func max<T: CGESimd4Support>(_ vector: T, _ scalar: CGFloat) -> T {
	return T(max(vector.simd, scalar.native))
}

/// Elementwise minimum of two vectors.  Each component of the result is the
/// smaller of the corresponding component of the inputs.
@inlinable
public func min<T: CGESimd4Support>(_ x: T, _ y: T) -> T {
	return T(min(x.simd, y.simd))
}

/// Vector-scalar minimum.  Each component of the result is the minimum of the
/// corresponding element of the input vector and the scalar.
@inlinable
public func min<T: CGESimd4Support>(_ vector: T, _ scalar: CGFloat) -> T {
	return T(min(vector.simd, scalar.native))
}

/// The infinity-norm (or "sup norm") of `x`.
@inlinable
public func norm_inf<T: CGESimd4Support>(_ x: T) -> CGFloat {
	return CGFloat(norm_inf(x.simd))
}

/// The one-norm (or "taxicab norm") of `x`.
@inlinable
public func norm_one<T: CGESimd4Support>(_ x: T) -> CGFloat {
	return CGFloat(norm_one(x.simd))
}

/// Unit vector pointing in the same direction as `x`.
@inlinable
public func normalize<T: CGESimd4Support>(_ x: T) -> T {
	return T(normalize(x.simd))
}

/// Projection of `x` onto `y`.
@inlinable
public func project<T: CGESimd4Support>(_ x: T, _ y: T) -> T {
	return T(project(x.simd, y.simd))
}

/// Elementwise reciprocal.
@inlinable
public func recip<T: CGESimd4Support>(_ x: T) -> T {
	return T(recip(x.simd))
}

/// Sum of the elements of the vector.
@inlinable
public func reduce_add<T: CGESimd4Support>(_ x: T) -> CGFloat {
	return CGFloat(reduce_add(x.simd))
}

/// Sum of the elements of the vector.
@inlinable
public func reduce_max<T: CGESimd4Support>(_ x: T) -> CGFloat {
	return CGFloat(reduce_max(x.simd))
}

/// Minimum element of the vector.
@inlinable
public func reduce_min<T: CGESimd4Support>(_ x: T) -> CGFloat {
	return CGFloat(reduce_min(x.simd))
}

/// `x` reflected through the hyperplane with unit normal vector `n`, passing
/// through the origin.  E.g. if `x` is [1,2,3] and `n` is [0,0,1], the result
/// is [1,2,-3].
@inlinable
public func reflect<T: CGESimd4Support>(_ x: T, n: T) -> T {
	return T(reflect(x.simd, n: n.simd))
}

/// The refraction direction given unit incident vector `x`, unit surface
/// normal `n`, and index of refraction `eta`.  If the angle between the
/// incident vector and the surface is so small that total internal reflection
/// occurs, zero is returned.
@inlinable
public func refract<T: CGESimd4Support>(_ x: T, n: T, eta: CGFloat) -> T {
	return T(refract(x.simd, n: n.simd, eta: eta.native))
}

/// Elementwise reciprocal square root.
@inlinable
public func rsqrt<T: CGESimd4Support>(_ x: T) -> T {
	return T(rsqrt(x.simd))
}

/// Sign of a vector.  Each lane contains -1 if the corresponding lane of `x`
/// is less than zero, +1 if the corresponding lane of `x` is greater than
/// zero, and 0 otherwise.
@inlinable
public func sign<T: CGESimd4Support>(_ x: T) -> T {
	return T(sign(x.simd))
}

/// 0.0 if `x < edge0`, 1.0 if `x > edge1`, and cubic interpolation between
/// 0 and 1 in the interval [edge0, edge1].
@inlinable
public func smoothstep<T: CGESimd4Support>(_ x: T, edge0: T, edge1: T) -> T {
	return T(smoothstep(x.simd, edge0: edge0.simd, edge1: edge1.simd))
}

/// 0.0 if `x < edge`, and 1.0 otherwise.
@inlinable
public func step<T: CGESimd4Support>(_ x: T, edge: T) -> T {
	return T(step(x.simd, edge: edge.simd))
}

/// Each element of the result is the closest integral value with magnitude
/// less than or equal to that of the corresponding element of the input.
@inlinable
public func trunc<T: CGESimd4Support>(_ x: T) -> T {
	return T(trunc(x.simd))
}
