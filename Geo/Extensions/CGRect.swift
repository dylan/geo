
extension CGRect {

    public var area: CGFloat {
        return size.height * width
    }

    private func alignOrigin(edge: CGRectEdge, to targetEdge: CGRectEdge, of rect: CGRect) -> CGPoint? {
        switch (edge, targetEdge) {
        case (.minXEdge, .minXEdge):
            return CGPoint(x: rect.minX, y: minY)
        case (.minXEdge, .maxXEdge):
            return CGPoint(x: rect.maxX, y: minY)
        case (.maxXEdge, .minXEdge):
            return CGPoint(x: rect.minX - width, y: minY)
        case (.maxXEdge, .maxXEdge):
            return CGPoint(x: rect.maxX - width, y: minY)
        case (.minYEdge, .minYEdge):
            return CGPoint(x: minX, y: rect.minY)
        case (.minYEdge, .maxYEdge):
            return CGPoint(x: minX, y: rect.maxY)
        case (.maxYEdge, .minYEdge):
            return CGPoint(x: minX, y: rect.minY - height)
        case (.maxYEdge, .maxYEdge):
            return CGPoint(x: minX, y: rect.maxY - height)
        default:
            print("Cannot align across different axes.")
            return nil
        }
    }

    public func align(edge: CGRectEdge, to targetEdge: CGRectEdge, of rect: CGRect) -> CGRect? {
        guard let newOrigin = alignOrigin(edge: edge, to: targetEdge, of: rect) else {
            return nil
        }
        return CGRect(origin: newOrigin, size: size)
    }

    public mutating func aligning(edge: CGRectEdge, to targetEdge: CGRectEdge, of rect: CGRect) {
        guard let newRect = align(edge: edge, to: targetEdge, of: rect) else {
            return
        }
        self = newRect
    }
}

