//
//  SecondListOfUsersTableCell.swift
//  WorkWithLists
//
//  Created by Pavel on 3.07.23.
//

import UIKit

final class SecondListOfUsersTableCell: UITableViewCell {
    static let identifer = "secondListOfUsersTableCell"

    lazy var cellAvatarView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Constants.cellAvatarSize / 2
        return imageView
    }()
    
    lazy var cellFirstLine: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 14)
        label.textColor = .white
        return label
    }()
    
    lazy var cellSecondLine: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 12)
        label.textColor = .lightGray
        return label
    }()
    
    lazy var cellThirdLine: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 12)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    lazy var cellGenderIconView = UIImageView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cellFirstLine, cellSecondLine, cellThirdLine])
        stackView.axis = .vertical
        stackView.spacing = 6
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: SecondListOfUsersTableCell.identifer)
        self.add(subviews: cellAvatarView, stackView, cellGenderIconView)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeConstraints() {
        cellAvatarView.snp.makeConstraints {
            $0.top.left.equalToSuperview().inset(Constants.commonInset)
            $0.size.equalTo(Constants.cellAvatarSize)
        }
        
        stackView.snp.makeConstraints {
            $0.left.equalTo(cellAvatarView.snp.right).inset(-Constants.commonInset)
            $0.top.bottom.equalToSuperview().inset(Constants.commonInset)
            $0.right.equalTo(cellGenderIconView.snp.left).inset(-Constants.commonInset)
        }

        cellGenderIconView.snp.makeConstraints {
            $0.top.right.equalToSuperview().inset(Constants.commonInset)
            $0.size.equalTo(Constants.cellGenderIconSize)
        }
    }
}
