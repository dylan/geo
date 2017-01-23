//
//  CGRectCorner.swift
//  Geo
//
//  Created by Dylan Wreggelsworth on 1/22/17.
//  Copyright © 2017 BVR, LLC. All rights reserved.
//

public enum CGRectCorner {
    case topLeft
    case topRight
    case bottomRight
    case bottomLeft

    public init(from edges: (CGRectEdge, CGRectEdge)) {
        
        if edges ~= (.minXEdge, .maxYEdge) {
            self = .topLeft
        } else if edges ~= (.maxXEdge, .maxYEdge) {
            self = .topRight
        } else if edges ~= (.maxXEdge, .minYEdge) {
            self = .bottomRight
        } else {
            self = .bottomLeft
        }
    }

    public var edges: (CGRectEdge, CGRectEdge) {
        switch self {
        case .topLeft :     return (.minXEdge, .maxYEdge)
        case .topRight:     return (.maxXEdge, .maxYEdge)
        case .bottomRight:  return (.maxXEdge, .minYEdge)
        case .bottomLeft:   return (.minXEdge, .minYEdge)
        }
    }
}

public func ~=(lhs: (CGRectEdge, CGRectEdge), rhs: (CGRectEdge, CGRectEdge)) -> Bool {
    return (lhs.0 == rhs.0 || lhs.0 == rhs.1) && (lhs.1 == rhs.0 || lhs.1 == rhs.1)
}
