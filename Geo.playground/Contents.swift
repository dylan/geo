//: Playground - noun: a place where people can play

import UIKit
import Geo


public class RectView: UIView {
    var rects: [CGRect]

    public init(frame frameRect: CGRect, with rects: [CGRect]) {
        self.rects = rects
        super.init(frame: frameRect)
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func draw(_ rect: CGRect) {
        for rect in rects {
            UIColor.red.setStroke()
            let path = UIBezierPath()
            path.move(to: rect.topLeft.point)
            path.addLine(to: rect.topRight.point)
            path.addLine(to: rect.bottomRight.point)
            path.addLine(to: rect.bottomLeft.point)
            path.close()
            path.stroke()
            let originRect = CGRect(origin: rect.origin, size: CGSize(width: 4, height: 4)).offsetBy(dx: -2, dy: -2)
            let origin = UIBezierPath(ovalIn: originRect)

            UIColor.red.setFill()
            origin.fill()
        }
    }
}

var rect0 = CGRect(origin: CGPoint.zero, size: CGSize(width: 5, height: 5))
var rect1 = CGRect(x: 10, y: 10, width: 15, height: 15)
var rect2 = CGRect(x: 80, y: 80, width: 30, height: 30)

rect1.topLeft.point
rect1.topRight.point
rect1.bottomRight.point
rect1.bottomLeft.point
rect1.area


extension CGRect {
    init(origin: CGPoint, width: CGFloat, height: CGFloat) {
        self = CGRect(x: origin.x, y: origin.x, width: width, height: height)
    }

    init(corner: Corner, width: CGFloat, height: CGFloat) {
        self = CGRect(origin: corner.point, width: width, height: height)
    }

    public func align(_ corner: Corner, to targetCorner: Corner) -> CGRect? {
        return self.align(corner.edges.0, to: targetCorner.edges.0)?
                   .align(corner.edges.1, to: targetCorner.edges.1)
    }

    public func align(_ edge: Edge, to targetEdge: Edge) -> CGRect? {
        switch (edge, targetEdge) {
        case (.left, .left),
             (.left, .right):
            return CGRect(x: targetEdge.cgFloat, y: top.cgFloat, width: width, height: height)
        case (.right, .left),
             (.right, .right):
            return CGRect(x: targetEdge.cgFloat - width, y: top.cgFloat, width: width, height: height)
        case (.top, .top),
             (.top, .bottom):
            return CGRect(x: left.cgFloat, y: targetEdge.cgFloat, width: width, height: height)
        case (.bottom, .top),
             (.bottom, .bottom):
            return CGRect(x: left.cgFloat, y: targetEdge.cgFloat - height, width: width, height: height)
        default:
            print("Cannot align across axes!")
            return nil
        }
    }
}

rect1 = rect1.align(.topLeft(of: rect1), to: .bottomRight(of: rect2))!

let displayRects = [rect1, rect2]

import PlaygroundSupport
PlaygroundPage.current.liveView = RectView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), with: displayRects)
