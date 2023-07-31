//
//  SeasonCell.swift
//  WorkWithLists
//
//  Created by Pavel on 30.07.23.
//

import UIKit

final class SeasonCell: UICollectionViewCell {
    static let identifer = "seasonCell"

    lazy var seasonLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 18)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.add(subviews: seasonLabel)
        setupCell()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        self.backgroundColor = UIColor(named: "Green")
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
    }
    
    private func makeConstraints() {
        seasonLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
