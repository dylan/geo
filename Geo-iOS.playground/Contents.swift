//: Playground - noun: a place where people can play

import UIKit
import Geo

var rect0 = CGRect(origin: CGPoint.zero, size: CGSize(width: 5, height: 5))
var rect1 = CGRect(x: 10, y: 10, width: 15, height: 15)
var rect2 = CGRect(x: 80, y: 80, width: 30, height: 30)



var vect1 = CGVector(M_2_PI)
vect1.integral
vect1.normalized()
vect1.integrate()
vect1.inverse
vect1.length
vect1.squared
vect1.normalize()

rect1.topLeft.cgPoint
rect1.topRight.cgPoint
rect1.bottomRight.cgPoint
rect1.bottomLeft.cgPoint
rect1.area

rect1.align(rect1.topLeft, to: rect2.bottomRight)

distance(CGPoint.zero, CGPoint(x: 1, y: 1))
midpoint(CGPoint.zero, CGPoint(x: 1, y: 1))

CGPoint.zero.distance(to: CGPoint(x: 1, y: 1))


let displayRects = [rect1, rect2]

import PlaygroundSupport
PlaygroundPage.current.liveView = RectView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), with: displayRects)
