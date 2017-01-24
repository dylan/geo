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

    // MARK: Operators
    public static func + (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x + right.x, y: left.y + right.y)
    }

    public static func - (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x - right.x, y: left.y - right.y)
    }

    public static func + (left: CGPoint, right: CGVector) -> CGPoint {
        return CGPoint(x: left.x + right.dx, y: left.y + right.dy)
    }

    public static func - (left: CGPoint, right: CGVector) -> CGPoint {
        return CGPoint(x: left.x - right.dx, y: left.y - right.dy)
    }

    public static func * (left: CGPoint, right: CGVector) -> CGPoint {
        return CGPoint(x: left.x * right.dx, y: left.y * right.dy)
    }

    public static func / (left: CGPoint, right: CGVector) -> CGPoint {
        return CGPoint(x: left.x / right.dx, y: left.y / right.dy)
    }

    public static func + (left: CGPoint, right: FloatLiteralType) -> CGPoint {
        return CGPoint(x: left.x + CGFloat(right), y: left.y + CGFloat(right))
    }

    public static func - (left: CGPoint, right: FloatLiteralType) -> CGPoint {
        return CGPoint(x: left.x - CGFloat(right), y: left.y - CGFloat(right))
    }

    public static func * (left: CGPoint, right: FloatLiteralType) -> CGPoint {
        return CGPoint(x: left.x * CGFloat(right), y: left.y * CGFloat(right))
    }

    public static func / (left: CGPoint, right: FloatLiteralType) -> CGPoint {
        return CGPoint(x: left.x / CGFloat(right), y: left.y / CGFloat(right))
    }
}
