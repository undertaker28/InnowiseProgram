//
//  CGRect+Ex.swift
//  WorkWithLists
//
//  Created by Pavel on 30.07.23.
//

import UIKit

extension CGRect {
    func dividedIntegral(fraction: CGFloat, from fromEdge: CGRectEdge, cellSpacing: CGFloat) -> (first: CGRect, second: CGRect) {
        let dimension: CGFloat
        
        switch fromEdge {
        case .minXEdge, .maxXEdge:
            dimension = self.size.width
        case .minYEdge, .maxYEdge:
            dimension = self.size.height
        }
        
        let distance = (dimension * fraction).rounded(.up)
        var slices = self.divided(atDistance: distance, from: fromEdge)
        
        switch fromEdge {
        case .minXEdge, .maxXEdge:
            slices.remainder.origin.x += cellSpacing
            slices.remainder.size.width -= cellSpacing
        case .minYEdge, .maxYEdge:
            slices.remainder.origin.y += cellSpacing
            slices.remainder.size.height -= cellSpacing
        }
        
        return (first: slices.slice, second: slices.remainder)
    }
}
