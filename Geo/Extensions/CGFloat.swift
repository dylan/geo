//
//  CGFloat.swift
//  Geo
//
//  Created by Dylan Wreggelsworth on 1/24/17.
//  Copyright © 2017 BVR, LLC. All rights reserved.
//

public func lerp(from a: CGFloat, to b: CGFloat, over time: CGFloat) -> CGFloat {
    return a + (b - a) * time
}
