//
//  TitleCell.swift
//  WorkWithLists
//
//  Created by Pavel on 30.07.23.
//

import UIKit

final class TitleCell: UICollectionViewCell {
    static let identifer = "titleCell"

    lazy var titleOnRussianCell: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 17)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var titleOnJapanCell: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 13)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var stackViewOfTitles: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleOnRussianCell, titleOnJapanCell])
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.add(subviews: stackViewOfTitles)
        setupCell()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        self.backgroundColor = UIColor(named: "Purple")
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
    }
    
    private func makeConstraints() {
        stackViewOfTitles.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview().inset(Constants.commonInset)
        }
    }
}
