//
//  FirstListOfUsersTableCell.swift
//  WorkWithLists
//
//  Created by Pavel on 2.07.23.
//

import UIKit

final class FirstListOfUsersTableCell: UITableViewCell {
    lazy var cellAvatarView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
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
        label.textColor = .gray
        return label
    }()
    
    lazy var cellGenderIconView = UIImageView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cellFirstLine, cellSecondLine])
        stackView.axis = .vertical
        stackView.spacing = 6
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "firstListOfUsersTableCell")
        self.add(subviews: cellAvatarView, stackView, cellGenderIconView)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeConstraints() {
        cellAvatarView.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }
        
        stackView.snp.makeConstraints {
            $0.left.equalTo(cellAvatarView.snp.right).inset(-16)
            $0.centerY.equalToSuperview()
        }
        
        cellGenderIconView.snp.makeConstraints {
            $0.right.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(24)
        }
    }
}
