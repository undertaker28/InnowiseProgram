//
//  PipetteAndZOrderView.swift
//  PipetteAndZ-order
//
//  Created by Pavel on 17.06.23.
//

import UIKit
import SnapKit

final class PipetteAndZOrderView: UIView {
    private lazy var containerView = self.createColoredView(backgroundColor: UIColor.appColor(.red) ?? UIColor.white, borderColor: UIColor.appColor(.blue) ?? UIColor.black)
    private lazy var view1 = self.createColoredView(backgroundColor: UIColor.appColor(.green) ?? UIColor.white, borderColor: UIColor.appColor(.silver) ?? UIColor.black)
    private lazy var view2 = self.createColoredView(backgroundColor: UIColor.appColor(.lightBlue) ?? UIColor.white, borderColor: UIColor.appColor(.silver) ?? UIColor.black)
    private lazy var view3 = self.createColoredView(backgroundColor: UIColor.appColor(.purple) ?? UIColor.white, borderColor: UIColor.appColor(.silver) ?? UIColor.black)
    private lazy var view4 = self.createColoredView(backgroundColor: UIColor.appColor(.black) ?? UIColor.white, borderColor: UIColor.appColor(.silver) ?? UIColor.black)
    private lazy var view5 = self.createColoredView(backgroundColor: UIColor.appColor(.orange) ?? UIColor.white, borderColor: UIColor.appColor(.silver) ?? UIColor.black)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubviews()
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        add(subviews: containerView)
        containerView.add(subviews: view1, view2, view3, view4)
        view4.add(subviews: view5)
    }
    
    private func makeConstraints() {
        containerView.snp.makeConstraints {
            $0.top.left.equalTo(safeAreaLayoutGuide)
            $0.width.equalToSuperview().multipliedBy(Constants.containerViewWidthMultiplier)
            $0.height.equalToSuperview().multipliedBy(Constants.containerViewHeightMultiplier)
        }
        
        view1.snp.makeConstraints {
            $0.top.left.equalToSuperview()
            $0.width.height.equalToSuperview().multipliedBy(Constants.multiplierValueForViewsInContainerView)
        }
        
        view2.snp.makeConstraints {
            $0.bottom.left.equalToSuperview()
            $0.width.height.equalToSuperview().multipliedBy(Constants.multiplierValueForViewsInContainerView)
        }
        
        view3.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalToSuperview().multipliedBy(Constants.multiplierValueForViewsInContainerView)
        }
        
        view4.snp.makeConstraints {
            $0.top.right.equalToSuperview()
            $0.width.height.equalToSuperview().multipliedBy(Constants.multiplierValueForViewsInContainerView)
        }
        
        view5.snp.makeConstraints {
            $0.top.right.equalToSuperview()
            $0.width.height.equalToSuperview().multipliedBy(Constants.multiplierValueForViewInView4)
        }
    }
}
