import CoreGraphics
import simd

public func distance(_ a: CGVector, _ b: CGVector) -> CGVector {
    return a - b
}

extension CGVector {
    public init(_ value: FloatLiteralType) {
        dx = CGFloat(value)
        dy = CGFloat(value)
    }

    public init(_ value: CGFloat) {
        dx = value
        dy = value
    }

    public init(_ point: float2) {
        dx = CGFloat(point.x)
        dy = CGFloat(point.y)
    }

    public init(_ point: CGPoint) {
        dx = CGFloat(point.x)
        dy = CGFloat(point.y)
    }

    public var squared: CGFloat {
        return dx * dx + dy * dy
    }

    public var length: CGFloat {
        return sqrt(squared)
    }

    public mutating func normalize() {
        if self.length == 0 {
            self = CGVector(dx: 1, dy: 0)
        } else {
            self = self / CGVector(self.length)
        }
    }

    public func normalized() -> CGVector {
        if self.length == 0 {
            return CGVector(dx: 1, dy: 0)
        } else {
            return self / CGVector(self.length)
        }
    }

    public mutating func integrateX() {
        dx = round(dx)
    }

    public mutating func integrateY() {
        dy = round(dy)
    }

    public mutating func integrate() {
        self.integrateX()
        self.integrateY()
    }

    public var integral: CGVector {
        return CGVector(dx: round(dx), dy: round(dy))
    }

    public mutating func invertX() {
        dx *= -1
    }

    public mutating func invertY() {
        dy *= -1
    }

    public mutating func invert() {
        self = self * -1
    }

    public var inverse: CGVector {
        return self * -1
    }

    // MARK: Operators

    public static func + (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx + right.dx, dy: left.dy + right.dy)
    }

    public static func - (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx - right.dx, dy: left.dy - right.dy)
    }

    public static func * (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx * right.dx, dy: left.dy * right.dy)
    }

    public static func / (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx / right.dx, dy: left.dy / right.dy)
    }

    public static func + (left: CGVector, right: CGFloat) -> CGVector {
        return CGVector(dx: left.dx + right, dy: left.dy + right)
    }

    public static func - (left: CGVector, right: CGFloat) -> CGVector {
        return CGVector(dx: left.dx - right, dy: left.dy - right)
    }

    public static func * (left: CGVector, right: CGFloat) -> CGVector {
        return CGVector(dx: left.dx * right, dy: left.dy * right)
    }

    public static func / (left: CGVector, right: CGFloat) -> CGVector {
        return CGVector(dx: left.dx / right, dy: left.dy / right)
    }
}

extension CGVector: CustomPlaygroundQuickLookable {
    public var customMirror: Mirror {
        return Mirror(self, children: ["dx": dx, "dy": dy], displayStyle: .struct)
    }

    public var customPlaygroundQuickLook: PlaygroundQuickLook {
        return PlaygroundQuickLook(reflecting: self)
    }
}

extension CGVector: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "(\(dx), \(dy))"
    }
}

