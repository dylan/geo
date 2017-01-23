//: Playground - noun: a place where people can play

import UIKit
import Geo

var rect0 = CGRect(origin: CGPoint.zero, size: CGSize(width: 5, height: 5))
var rect1 = CGRect(x: 50, y: 50, width: 10, height: 10)
var rect2 = CGRect(x: 80, y: 80, width: 20, height: 20)

guard let rect3 = rect1.align(corner: .topRight, to: .topRight, of: rect2) else {
    fatalError()
}

rect3

import PlaygroundSupport
PlaygroundPage.current.liveView = RectView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), with: [rect0, rect2, rect3])
