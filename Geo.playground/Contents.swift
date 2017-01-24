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
            path.move(to: rect.topLeft.cgPoint)
            path.addLine(to: rect.topRight.cgPoint)
            path.addLine(to: rect.bottomRight.cgPoint)
            path.addLine(to: rect.bottomLeft.cgPoint)
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

rect1.topLeft.cgPoint
rect1.topRight.cgPoint
rect1.bottomRight.cgPoint
rect1.bottomLeft.cgPoint
rect1.area

rect1.align(rect1.topLeft, to: rect2.bottomRight)

distance(CGPoint.zero, CGPoint(x: 1, y: 1))
midpoint(CGPoint.zero, CGPoint(x: 1, y: 1))


let displayRects = [rect1, rect2]

import PlaygroundSupport
PlaygroundPage.current.liveView = RectView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), with: displayRects)
