import CoreGraphics

public func lerp(from a: CGFloat, to b: CGFloat, over time: CGFloat) -> CGFloat {
    return a + (b - a) * time
}
