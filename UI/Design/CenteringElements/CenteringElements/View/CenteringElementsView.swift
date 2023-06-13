//
//  CenteringElementsView.swift
//  CenteringElements
//
//  Created by Pavel on 13.06.23.
//

import UIKit
import SnapKit

final class CenteringElementsView: UIView {
    private lazy var view1 = self.createColoredView(withColor: UIColor.appColor(.purple) ?? UIColor.cyan)
    private lazy var view2 = self.createColoredView(withColor: UIColor.appColor(.red) ?? UIColor.cyan)
    private lazy var view3 = self.createColoredView(withColor: UIColor.appColor(.yellow) ?? UIColor.cyan)

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.backgroundColor = UIColor.appColor(.green) ?? UIColor.cyan
        return button
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [view1, view2, view3, button])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 25
        stackView.layer.borderColor = UIColor.appColor(.black)?.cgColor
        stackView.layer.borderWidth = 1
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.add(subviews: stackView)
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeConstraints() {
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.right.equalToSuperview().inset(10)
        }
        
        view1.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(stackView).offset(10)
        }
        
        view2.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        view3.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        button.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalTo(stackView).offset(-10)
        }
    }
}
