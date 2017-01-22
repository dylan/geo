import Foundation
import UIKit

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
            let path = UIBezierPath(rect: rect)
            path.stroke()
        }
    }
}
