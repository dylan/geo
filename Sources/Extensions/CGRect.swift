import CoreGraphics

public enum Edge {
    case top(of: CGRect)
    case right(of: CGRect)
    case bottom(of: CGRect)
    case left(of: CGRect)

    public var cgRect: CGRect {
        switch self {
        case .top(let rect),
             .right(let rect),
             .bottom(let rect),
             .left(let rect):
            return rect
        }
    }

    public var cgFloat: CGFloat {
        switch self {
        case .top(let rect):
            #if os(iOS)
                return rect.origin.y
            #else
                return rect.origin.y + rect.height
            #endif
        case .right(let rect):
            return rect.origin.x + rect.width
        case .bottom(let rect):
            #if os(iOS)
                return rect.origin.y + rect.height
            #else
                return rect.origin.y
            #endif
        case .left(let rect):
            return rect.origin.x
        }
    }
    public var midPoint: CGPoint {
        switch self {
        case .top(let rect):
            return midpoint(a: rect.topLeft, b: rect.topRight)
        case .right(let rect):
            return midpoint(a: rect.topRight, b: rect.bottomRight)
        case .bottom(let rect):
            return midpoint(a: rect.bottomLeft, b: rect.bottomRight)
        case .left(let rect):
            return midpoint(a: rect.topLeft, b: rect.bottomLeft)
        }
    }
}

public func midpoint(a: Corner, b: Corner) -> CGPoint {
    return midpoint(a.cgPoint, b.cgPoint)
}

public enum Corner {
    case topLeft(of: CGRect)
    case topRight(of: CGRect)
    case bottomRight(of: CGRect)
    case bottomLeft(of: CGRect)

    public var cgRect: CGRect {
        switch self {
            case .topLeft(let rect),
                 .topRight(let rect),
                 .bottomRight(let rect),
                 .bottomLeft(let rect):
            return rect
        }
    }

    public var edges: (Edge, Edge) {
        switch self {
        case .topLeft(let rect):
            return (rect.top, rect.left)
        case .topRight(let rect):
            return (rect.top, rect.right)
        case .bottomRight(let rect):
            return (rect.bottom, rect.right)
        case .bottomLeft(let rect):
            return (rect.bottom, rect.left)
        }
    }

    public var cgPoint: CGPoint {
        switch self {
        case .topLeft(let rect):
            return CGPoint(x: rect.left.cgFloat, y: rect.top.cgFloat)
        case .topRight(let rect):
            return CGPoint(x: rect.right.cgFloat, y: rect.top.cgFloat)
        case .bottomRight(let rect):
            return CGPoint(x: rect.right.cgFloat, y: rect.bottom.cgFloat)
        case .bottomLeft(let rect):
            return CGPoint(x: rect.left.cgFloat, y: rect.bottom.cgFloat)
        }
    }
}

extension CGRect {

    public init(origin: CGPoint, width: CGFloat, height: CGFloat) {
        self = CGRect(x: origin.x, y: origin.x, width: width, height: height)
    }

    public init(corner: Corner, width: CGFloat, height: CGFloat) {
        self = CGRect(origin: corner.cgPoint, width: width, height: height)
    }

    public init(topLeft: CGPoint, bottomRight: CGPoint) {
        self = CGRect(x: topLeft.x,
                      y: topLeft.y,
                      width: bottomRight.x + topLeft.x,
                      height: topLeft.y + bottomRight.y)
    }

    /// Returns the y value for the top side of the CGRect.
    public var top: Edge {
        return Edge.top(of: self)
    }

    /// Returns the x value for the right side of the CGRect.
    public var right: Edge {
        return Edge.right(of: self)
    }

    /// Returns the x value for the bottom side of the CGRect.
    public var bottom: Edge {
        return Edge.bottom(of: self)
    }

    /// Returns the x value for the left side of the CGRect.
    public var left: Edge {
        return Edge.left(of: self)
    }

    public var area: CGFloat {
        return size.height * width
    }

    public var topLeft: Corner {
        return Corner.topLeft(of: self)
    }

    public var topRight: Corner {
        return Corner.topRight(of: self)
    }

    public var bottomRight: Corner {
        return Corner.bottomRight(of: self)
    }

    public var bottomLeft: Corner {
        return Corner.bottomLeft(of: self)
    }

    public mutating func align(_ corner: Corner, to targetCorner: Corner) {
        self = self.aligning(corner.edges.0, to: targetCorner.edges.0)
                   .aligning(corner.edges.1, to: targetCorner.edges.1)
    }

    public func aligning(_ corner: Corner, to targetCorner: Corner) -> CGRect {
        return self.aligning(corner.edges.0, to: targetCorner.edges.0)
                   .aligning(corner.edges.1, to: corner.edges.1)
    }

    public mutating func align(_ edge: Edge, to targetEdge: Edge) {
        self = self.aligning(edge, to: targetEdge)
    }

    public func aligning(_ edge: Edge, to targetEdge: Edge) -> CGRect {
        switch (edge, targetEdge) {
        case (.left, .left),
             (.left, .right):
            return CGRect(x: targetEdge.cgFloat,
                          y: top.cgFloat,
                      width: width,
                     height: height)


        case (.right, .left),
             (.right, .right):
            return CGRect(x: targetEdge.cgFloat - width,
                          y: top.cgFloat,
                      width: width,
                     height: height)

        case (.top, .top),
             (.top, .bottom):
            return CGRect(x: left.cgFloat,
                          y: targetEdge.cgFloat,
                      width: width,
                     height: height)

        case (.bottom, .top),
             (.bottom, .bottom):
            return CGRect(x: left.cgFloat,
                          y: targetEdge.cgFloat - height,
                      width: width,
                     height: height)
        default:
            assertionFailure("Cannot align across edges, no changes made!")
            return edge.cgRect
        }
    }
}

