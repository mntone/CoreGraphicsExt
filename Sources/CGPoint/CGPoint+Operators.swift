import simd
#if os(macOS)
import struct CoreGraphics.CGGeometry.CGFloat
import struct CoreGraphics.CGGeometry.CGPoint
#else
import struct CoreGraphics.CGFloat
import struct CoreGraphics.CGPoint
#endif

infix operator +-: AdditionPrecedence
infix operator -+: AdditionPrecedence
infix operator +-=: AssignmentPrecedence
infix operator -+=: AssignmentPrecedence

public extension CGPoint {
    // MARK: V ? V
    static func +- (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y - rhs.y)
    }
    
    static func -+ (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y + rhs.y)
    }
    
    // MARK: C ? V
    static func +- (lhs: CGFloat, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs + rhs.x, y: lhs - rhs.y)
    }
    
    static func -+ (lhs: CGFloat, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs - rhs.x, y: lhs + rhs.y)
    }
    
    // MARK: V ? C
    static func +- (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x + rhs, y: lhs.y - rhs)
    }
    
    static func -+ (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x - rhs, y: lhs.y + rhs)
    }
    
    // MARK: V ?= V
    static func +-= (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = CGPoint(x: lhs.x + rhs.x, y: lhs.y - rhs.y)
    }
    
    static func -+= (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = CGPoint(x: lhs.x - rhs.x, y: lhs.y + rhs.y)
    }
    
    // MARK: V ?= C
    static func +-= (lhs: inout CGPoint, rhs: CGFloat) {
        lhs = CGPoint(x: lhs.x + rhs, y: lhs.y - rhs)
    }
    
    static func -+= (lhs: inout CGPoint, rhs: CGFloat) {
        lhs = CGPoint(x: lhs.x - rhs, y: lhs.y + rhs)
    }
}
