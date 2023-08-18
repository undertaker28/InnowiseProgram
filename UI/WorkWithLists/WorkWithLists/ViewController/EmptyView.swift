//
//  EmptyView.swift
//  WorkWithLists
//
//  Created by Pavel on 31.07.23.
//

import UIKit
import SnapKit

final class EmptyView: UIView {
    private lazy var noUsersAvailableView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "SadEmoji")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .white
        return imageView
    }()
    
    private lazy var firstEmptyMessage: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 22)
        label.text = "OOOPS!"
        label.textColor = .white
        return label
    }()
    
    private lazy var secondEmptyMessage: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 18)
        label.text = "There are no available users right now"
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [noUsersAvailableView, firstEmptyMessage, secondEmptyMessage])
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.alignment = .center
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        self.add(subviews: stackView)
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeConstraints()
    }
    
    private func setupView() {
        self.backgroundColor = UIColor(named: "Gray")
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
    }
    
    private func makeConstraints() {
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        noUsersAvailableView.snp.makeConstraints {
            $0.size.equalTo(Constants.noUsersAvailableImageSize)
        }
    }
}
