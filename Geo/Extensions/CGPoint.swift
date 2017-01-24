import CoreGraphics
import simd

public func distance(_ a: CGPoint, _ b: CGPoint) -> CGFloat {
    return hypot(b.x - a.x, b.y - a.y)
}

public func midpoint(_ a: CGPoint, _ b: CGPoint) -> CGPoint {
    return CGPoint(x: a.x + b.x / 2, y: a.y + b.y / 2)
}

extension CGPoint {

    init(_ point: float2) {
        x = CGFloat(point.x)
        y = CGFloat(point.y)
    }

    public func distance(to point: CGPoint) -> CGFloat {
        return Geo.distance(self, point)
    }

    public func midpoint(to point: CGPoint) -> CGPoint {
        return Geo.midpoint(self, point)
    }

    public static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }

    public static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }

    public static func + (lhs: CGPoint, rhs: CGVector) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.dx, y: lhs.y + rhs.dy)
    }

    public static func - (lhs: CGPoint, rhs: CGVector) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.dx, y: lhs.y - rhs.dy)
    }

    public static func * (lhs: CGPoint, rhs: CGVector) -> CGPoint {
        return CGPoint(x: lhs.x * rhs.dx, y: lhs.y * rhs.dy)
    }

    public static func / (lhs: CGPoint, rhs: CGVector) -> CGPoint {
        return CGPoint(x: lhs.x / rhs.dx, y: lhs.y / rhs.dy)
    }

    public static func + (lhs: CGPoint, rhs: FloatLiteralType) -> CGPoint {
        return CGPoint(x: lhs.x + CGFloat(rhs), y: lhs.y + CGFloat(rhs))
    }

    public static func - (lhs: CGPoint, rhs: FloatLiteralType) -> CGPoint {
        return CGPoint(x: lhs.x - CGFloat(rhs), y: lhs.y - CGFloat(rhs))
    }

    public static func * (lhs: CGPoint, rhs: FloatLiteralType) -> CGPoint {
        return CGPoint(x: lhs.x * CGFloat(rhs), y: lhs.y * CGFloat(rhs))
    }

    public static func / (lhs: CGPoint, rhs: FloatLiteralType) -> CGPoint {
        return CGPoint(x: lhs.x / CGFloat(rhs), y: lhs.y / CGFloat(rhs))
    }
}
