import CoreGraphics
import simd

extension CGVector {
    public init(_ point: float2) {
        dx = CGFloat(point.x)
        dy = CGFloat(point.y)
    }

    public init(_ point: CGPoint) {
        dx = CGFloat(point.x)
        dy = CGFloat(point.y)
    }

    public var quadrance: CGFloat {
        return dx * dx + dy * dy
    }

    public var normalize: CGVector? {
        let quadrance = self.quadrance
        if quadrance > 0.0 {
            return self / sqrt(quadrance)
        } else {
            return nil
        }
    }

    // MARK: Operators
    public static func /(left: CGVector, right: CGFloat) -> CGVector {
        return CGVector(dx: left.dx / right, dy: left.dy / right)
    }
}


