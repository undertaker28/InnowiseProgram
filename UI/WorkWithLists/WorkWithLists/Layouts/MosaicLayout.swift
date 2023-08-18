//
//  MosaicLayout.swift
//  WorkWithLists
//
//  Created by Pavel on 30.07.23.
//

import UIKit
import SnapKit

enum MosaicSegmentStyle {
    case twoThirdsOneThird
    case fullWidth
    case oneThirdTwoThirds
}

final class MosaicLayout: UICollectionViewLayout {
    private var contentBounds = CGRect.zero
    private var cachedAttributes = [UICollectionViewLayoutAttributes]()
    
    // MARK: - PrepareMosaicLayout
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        // Reset cached information
        cachedAttributes.removeAll()
        contentBounds = CGRect(origin: .zero, size: collectionView.bounds.size)
        
        // For every item in the collection view:
        //  - Prepare the attributes
        //  - Store attributes in the cachedAttributes array
        //  - Combine contentBounds with attributes.frame
        let count = collectionView.numberOfItems(inSection: 0)
        
        var currentIndex = 0
        var fullWidthCount = 0
        var segment: MosaicSegmentStyle = .twoThirdsOneThird
        var lastFrame: CGRect = .zero
        
        let cvWidth = collectionView.bounds.size.width
        let cellSpacing: CGFloat = 6
        
        while currentIndex < count {
            let segmentFrame = CGRect(x: 0, y: lastFrame.maxY + cellSpacing, width: cvWidth, height: 100)
            
            var segmentRects = [CGRect]()
            switch segment {
            case .fullWidth:
                segmentRects = [segmentFrame]
                fullWidthCount += 1
                
            case .twoThirdsOneThird:
                let horizontalSlices = segmentFrame.dividedIntegral(fraction: (2 / 3), from: .minXEdge, cellSpacing: cellSpacing)
                let verticalSlices = horizontalSlices.second.dividedIntegral(fraction: 0.5, from: .minYEdge, cellSpacing: cellSpacing)
                segmentRects = [horizontalSlices.first, verticalSlices.first, verticalSlices.second]
                
            case .oneThirdTwoThirds:
                let horizontalSlices = segmentFrame.dividedIntegral(fraction: (1 / 3), from: .minXEdge, cellSpacing: cellSpacing)
                let verticalSlices = horizontalSlices.first.dividedIntegral(fraction: 0.5, from: .minYEdge, cellSpacing: cellSpacing)
                segmentRects = [verticalSlices.first, verticalSlices.second, horizontalSlices.second]
            }
            
            // Create and cache layout attributes for calculated frames
            for rect in segmentRects {
                let attributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: currentIndex, section: 0))
                attributes.frame = rect
                
                cachedAttributes.append(attributes)
                contentBounds = contentBounds.union(rect) // Update contentBounds with rect
                
                currentIndex += 1
                lastFrame = rect
            }
            
            // Determine the next segment style
            switch count - currentIndex {
            case 1:
                segment = .fullWidth
                contentBounds.size.height = lastFrame.maxY
            default:
                switch segment {
                case .fullWidth:
                    segment = fullWidthCount % 2 == 0 ? .twoThirdsOneThird : .oneThirdTwoThirds
                default:
                    segment = .fullWidth
                }
            }
        }
    }
    
    // MARK: - CollectionViewContentSize
    override var collectionViewContentSize: CGSize {
        return contentBounds.size
    }
    
    // MARK: - ShouldInvalidateLayout
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        guard let collectionView = collectionView else { return false }
        return !newBounds.size.equalTo(collectionView.bounds.size)
    }
    
    // MARK: - LayoutAttributesForItem
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cachedAttributes[indexPath.item]
    }
    
    // MARK: - LayoutAttributesForElements
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributesArray = [UICollectionViewLayoutAttributes]()
        
        // Find any cell that sits within the query rect
        guard let lastIndex = cachedAttributes.indices.last,
              let firstMatchIndex = binarySearch(rect, start: 0, end: lastIndex) else { return attributesArray }
        
        // Starting from the match, loop up and down through the array until all the attributes
        // have been added within the query rect
        for attributes in cachedAttributes[..<firstMatchIndex].reversed() {
            guard attributes.frame.maxY >= rect.minY else { break }
            attributesArray.append(attributes)
        }
        
        for attributes in cachedAttributes[firstMatchIndex...] {
            guard attributes.frame.minY <= rect.maxY else { break }
            attributesArray.append(attributes)
        }
        
        return attributesArray
    }
    
    // Perform a binary search on the cached attributes array
    private func binarySearch(_ rect: CGRect, start: Int, end: Int) -> Int? {
        if end < start { return nil }
        
        let mid = (start + end) / 2
        let attribute = cachedAttributes[mid]
        
        if attribute.frame.intersects(rect) {
            return mid
        } else {
            if attribute.frame.maxY < rect.minY {
                return binarySearch(rect, start: (mid + 1), end: end)
            } else {
                return binarySearch(rect, start: start, end: (mid - 1))
            }
        }
    }
}
