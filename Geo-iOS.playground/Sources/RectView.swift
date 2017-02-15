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
        let originCRect = CGRect(origin: CGPoint.zero, size: CGSize(width: 6, height: 6)).offsetBy(dx: -3, dy: -3)
        let originC = UIBezierPath(ovalIn: originCRect)
        UIColor.blue.setFill()
        originC.fill()
        
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
