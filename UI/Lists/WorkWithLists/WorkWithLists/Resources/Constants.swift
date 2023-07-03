//
//  Constants.swift
//  WorkWithLists
//
//  Created by Pavel on 3.07.23.
//

import UIKit

enum Constants {
    // MARK: - List Configuration
    static let numberOfFakeUsersToGenerate = 30
    static let numberOfElementsInThirdScreen = 20
    
    // MARK: - Cell Sizes
    static let cellAvatarSize: CGFloat = 40
    static let cellGenderIconSize: CGFloat = 24
    static let collectionCellHeight: CGFloat = 100
    
    // MARK: - Insets
    static let commonInset: CGFloat = 16
    static let categoryLabelInset: CGFloat = 10
    
    // MARK: - Symbol Configuration (pointSize = 90 is too much for SF Symbol)
    static let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 80)
    
    // MARK: - Category Data
    static let categories = ["My games", "My health", "My notes", "My purchases", "My photos", "My friends"]
    static let icons = ["gamecontroller", "heart", "note.text", "bag", "camera", "person.2"]
    static let colors = [UIColor(named: "Blue"), UIColor(named: "Pink"), UIColor(named: "Purple"), UIColor(named: "Red"), UIColor(named: "Yellow"), UIColor(named: "Green")]
}
