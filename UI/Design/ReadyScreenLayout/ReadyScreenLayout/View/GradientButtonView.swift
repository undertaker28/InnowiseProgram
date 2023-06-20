//
//  GradientButtonView.swift
//  ReadyScreenLayout
//
//  Created by Pavel on 19.06.23.
//

import UIKit

final class GradientButton: UIButton {
    private var gradientColors: [UIColor]?

    convenience init(colors: [UIColor]) {
        self.init(frame: .zero)
        gradientColors = colors
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        if let colors = gradientColors {
            l.colors = colors.map { $0.cgColor }
        }
        l.startPoint = CGPoint(x: 0, y: 0.5)
        l.endPoint = CGPoint(x: 1, y: 0.5)
        l.cornerRadius = 18
        layer.insertSublayer(l, at: 0)
        return l
    }()
}
