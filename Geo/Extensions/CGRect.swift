
extension CGRect {

    public var area: CGFloat {
        return size.height * width
    }

    public func align(corner: CGRectCorner, to targetCorner: CGRectCorner, of rect: CGRect) -> CGRect? {
        return align(edge: corner.edges.0, to: targetCorner.edges.0, of: rect)?
            .align(edge: corner.edges.1, to: targetCorner.edges.1, of: rect)
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
            #if os(iOS)
            return CGPoint(x: minX, y: rect.minY - height)
            #else
            return CGPoint(x: minX, y: rect.minY + height)
            #endif
        case (.maxYEdge, .maxYEdge):
            #if os(iOS)
                return CGPoint(x: minX, y: rect.maxY - height)
            #else
                return CGPoint(x: minX, y: rect.maxY + height)
            #endif
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

