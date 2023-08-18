//
//  RatingCell.swift
//  WorkWithLists
//
//  Created by Pavel on 30.07.23.
//

import UIKit

final class RatingCell: UICollectionViewCell {
    static let identifer = "ratingCell"

    lazy var ratingCell: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 18)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.add(subviews: ratingCell)
        setupCell()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        self.backgroundColor = UIColor(named: "LightBlue")
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
    }
    
    private func makeConstraints() {
        ratingCell.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
