//
//  CGRectCorner.swift
//  Geo
//
//  Created by Dylan Wreggelsworth on 1/22/17.
//  Copyright © 2017 BVR, LLC. All rights reserved.
//

import Foundation

public func ~=(lhs: (CGRectEdge, CGRectEdge), rhs: (CGRectEdge, CGRectEdge)) -> Bool {
    return lhs.0 == rhs.0 || lhs.0 == rhs.1 && lhs.1 == rhs.0 || lhs.1 == rhs.1
}


enum CGRectCorner {
    case topLeft
    case topRight
    case bottomRight
    case bottomLeft

//    init(from edges: (CGRectEdge, CGRectEdge)) {
//        switch edges {
//        case (.minXEdge, .maxYEdge) :
//            self = .topLeft
//        case (.maxXEdge, .maxYEdge):
//            self = .topRight
//        case (.maxXEdge, .minYEdge):
//            self = .bottomRight
//        case (.minXEdge, .minYEdge):
//            self = .bottomLeft
//        }
//    }

    var edges: (CGRectEdge, CGRectEdge) {
        switch self {
        case .topLeft :     return (.minXEdge, .maxYEdge)
        case .topRight:     return (.maxXEdge, .maxYEdge)
        case .bottomRight:  return (.maxXEdge, .minYEdge)
        case .bottomLeft:   return (.minXEdge, .minYEdge)
        }
    }

//    public corner(of rect: CGRect) -> CGPoint
//        switch self {
//        case .topLeft :     return CGPoint(x: .minX, y: .maxY)
//        case .topRight:     return CGPoint(x: .maxX, y: .maxY)
//        case .bottomRight:  return CGPoint(x: .maxX, y: .minY)
//        case .bottomLeft:   return CGPoint(x: .minX, y: .minY)
//        }
//    }
}
