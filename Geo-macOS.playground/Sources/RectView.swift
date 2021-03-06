import Foundation
import Cocoa
import Geo

public class RectView: NSView {
    var rects: [CGRect]

    public init(frame frameRect: NSRect, with rects: [CGRect]) {
        self.rects = rects
        super.init(frame: frameRect)
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func draw(_ dirtyRect: NSRect) {
        let originCRect = CGRect(origin: CGPoint.zero, size: CGSize(width: 6, height: 6)).offsetBy(dx: -3, dy: -3)
        let originC = NSBezierPath(ovalIn: originCRect)
        NSColor.blue.setFill()
        originC.fill()

        for rect in rects {
            NSColor.red.setStroke()
            let path = NSBezierPath()
            path.move(to: rect.topLeft.cgPoint)
            path.line(to: rect.topRight.cgPoint)
            path.line(to: rect.bottomRight.cgPoint)
            path.line(to: rect.bottomLeft.cgPoint)
            path.close()
            path.stroke()
            let originRect = CGRect(origin: rect.origin, size: CGSize(width: 4, height: 4)).offsetBy(dx: -2, dy: -2)
            let origin = NSBezierPath(ovalIn: originRect)

            NSColor.red.setFill()
            origin.fill()
        }
    }
}
