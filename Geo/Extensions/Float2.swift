import CoreGraphics
import simd

extension float2 {
    public init(_ point: CGPoint) {
        self = float2(Float(point.x), Float(point.y))
    }
}
