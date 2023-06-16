//
//  ZOrderAndRelativeSizeView.swift
//  Z-orderAndRelativeSize
//
//  Created by Pavel on 16.06.23.
//

import UIKit
import SnapKit

final class ZOrderAndRelativeSizeView: UIView {
    private lazy var view1 = self.createColoredView(withColor: UIColor.appColor(.apricot) ?? UIColor.cyan)
    private lazy var view2 = self.createColoredView(withColor: UIColor.appColor(.red) ?? UIColor.cyan)
    private lazy var view3 = self.createColoredView(withColor: UIColor.appColor(.purple) ?? UIColor.cyan)

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [view1, view2, view3])
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(stackView)
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeConstraints() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        view1.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(Constants.view1WidthMultiplier)
            $0.height.equalToSuperview().multipliedBy(Constants.view1HeightMultiplier)
        }
        
        view2.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(Constants.view2WidthMultiplier)
            $0.height.equalToSuperview().multipliedBy(Constants.view2HeightMultiplier)
        }
        
        view3.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(Constants.view3WidthMultiplier)
            $0.height.equalToSuperview().multipliedBy(Constants.view3HeightMultiplier)
        }
    }
}
