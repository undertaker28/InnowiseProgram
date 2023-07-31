//
//  CoverImageCell.swift
//  WorkWithLists
//
//  Created by Pavel on 30.07.23.
//

import UIKit

final class CoverImageCell: UICollectionViewCell {
    static let identifer = "coverImageCell"
    
    lazy var cellCoverImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.add(subviews: cellCoverImage)
        setupCell()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        self.backgroundColor = UIColor(named: "Orange")
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
    }
    
    private func makeConstraints() {
        cellCoverImage.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(90)
        }
    }
}
