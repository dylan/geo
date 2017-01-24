//
//  CGPoint.swift
//  Geo
//
//  Created by Dylan Wreggelsworth on 1/23/17.
//  Copyright © 2017 BVR, LLC. All rights reserved.
//

extension CGPoint {
    public static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }

    public static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }

    public static func + (lhs: CGPoint, rhs: CGVector) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.dx, y: lhs.y + rhs.dy)
    }

    public static func - (lhs: CGPoint, rhs: CGVector) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.dx, y: lhs.y - rhs.dy)
    }

    public static func * (lhs: CGPoint, rhs: CGVector) -> CGPoint {
        return CGPoint(x: lhs.x * rhs.dx, y: lhs.y * rhs.dy)
    }

    public static func / (lhs: CGPoint, rhs: CGVector) -> CGPoint {
        return CGPoint(x: lhs.x / rhs.dx, y: lhs.y / rhs.dy)
    }

    public static func + (lhs: CGPoint, rhs: FloatLiteralType) -> CGPoint {
        return CGPoint(x: lhs.x + CGFloat(rhs), y: lhs.y + CGFloat(rhs))
    }

    public static func - (lhs: CGPoint, rhs: FloatLiteralType) -> CGPoint {
        return CGPoint(x: lhs.x - CGFloat(rhs), y: lhs.y - CGFloat(rhs))
    }

    public static func * (lhs: CGPoint, rhs: FloatLiteralType) -> CGPoint {
        return CGPoint(x: lhs.x * CGFloat(rhs), y: lhs.y * CGFloat(rhs))
    }

    public static func / (lhs: CGPoint, rhs: FloatLiteralType) -> CGPoint {
        return CGPoint(x: lhs.x / CGFloat(rhs), y: lhs.y / CGFloat(rhs))
    }


}
