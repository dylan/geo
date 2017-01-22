//: Playground - noun: a place where people can play

import UIKit
import Geo

var rect1 = CGRect(x: 50, y: 50, width: 10, height: 10)
var rect2 = CGRect(x: 80, y: 80, width: 20, height: 20)

rect1.aligning(edge: .maxXEdge, to: .minXEdge, of: rect2)
rect1.aligning(edge: .minYEdge, to: .minYEdge, of: rect2)

(CGRectEdge.maxXEdge, CGRectEdge.minYEdge) ~= (CGRectEdge.maxXEdge, CGRectEdge.maxXEdge)

import PlaygroundSupport
PlaygroundPage.current.liveView = RectView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), with: [rect1, rect2])
