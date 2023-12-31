//
//  ThirdGridCollectionCell.swift
//  WorkWithLists
//
//  Created by Pavel on 3.07.23.
//

import UIKit

final class ThirdGridCollectionCell: UICollectionViewCell {
    static let identifer = "thirdGridCollectionCell"

    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 17)
        label.textColor = .white
        label.layer.zPosition = 1
        return label
    }()
    
    lazy var cellIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.layer.zPosition = 0
        imageView.alpha = 0.25
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.add(subviews: categoryLabel, cellIconView)
        setupCell()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tapGestureRecognizer)
        self.isUserInteractionEnabled = true
    }
    
    @objc private func handleTap() {
        UIView.animate(withDuration: 0.5, animations: {
            self.layer.transform = CATransform3DMakeRotation(CGFloat.pi, 0.0, 1.0, 0.0)
        }) { (finished) in
            UIView.animate(withDuration: 0.5, animations: {
                self.layer.transform = CATransform3DIdentity
            })
        }
    }
    
    private func makeConstraints() {
        categoryLabel.snp.makeConstraints {
            $0.left.bottom.equalToSuperview().inset(Constants.categoryLabelInset)
        }
        
        cellIconView.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}
