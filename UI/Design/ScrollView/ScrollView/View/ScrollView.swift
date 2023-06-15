//
//  ScrollView.swift
//  ScrollView
//
//  Created by Pavel on 15.06.23.
//

import UIKit
import SnapKit

final class ScrollView: UIView {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = self.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.frame.size = contentSize
        return contentView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 40
        return stackView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.backgroundColor = .green
        return button
    }()
    
    private var contentSize: CGSize {
        CGSize(width: self.frame.width, height: self.frame.height)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubviews()
        setupColorsView()
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        contentView.addSubview(button)
    }
    
    private func makeConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        for view in stackView.arrangedSubviews {
            view.snp.makeConstraints {
                $0.height.equalTo(250)
                $0.left.right.equalTo(contentView).inset(50)
            }
        }
        
        button.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.left.right.equalTo(contentView).inset(50)
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(30)
        }
    }
    
    private func setupColorsView() {
        let colors: [UIColor] = [.red, .yellow]
        for index in 0...1 {
            let view = UIView()
            view.backgroundColor = colors[index % colors.count]
            stackView.addArrangedSubview(view)
        }
    }
}
