//
//  CircleProgressBarView.swift
//  CustomProgressBar
//
//  Created by Pavel on 28.06.23.
//

import UIKit
import SnapKit

final class CircleProgressBarView: UIView {
    private let progressLayer = CAShapeLayer()
    private let backgroundLayer = CAShapeLayer()
    
    private let progressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 20)
        label.textColor = .black
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
        setupProgressLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayers()
        setupProgressLabel()
    }

    private func setupLayers() {
        backgroundLayer.strokeColor = UIColor(named: "Opal")?.cgColor
        backgroundLayer.lineWidth = 13
        backgroundLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(backgroundLayer)

        progressLayer.strokeColor = UIColor(named: "SmaltBlue")?.cgColor
        progressLayer.lineWidth = 26
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeEnd = 0
        progressLabel.text = "0"
        layer.addSublayer(progressLayer)
    }

    private func setupProgressLabel() {
        addSubview(progressLabel)

        progressLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = (min(bounds.width, bounds.height) - progressLayer.lineWidth) / 2
        let startAngle = -CGFloat.pi / 2
        let endAngle = startAngle + (2 * CGFloat.pi)

        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)

        backgroundLayer.path = circularPath.cgPath
        progressLayer.path = circularPath.cgPath
    }
    
    func setProgress(_ progress: CGFloat) {
        let clampedProgress = progress

        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = progressLayer.strokeEnd
        animation.toValue = clampedProgress
        animation.duration = 0.3

        progressLayer.strokeEnd = clampedProgress
        progressLayer.add(animation, forKey: "progressAnimation")
        
        let progressPercentage = Int(clampedProgress * 100)
        progressLabel.text = "\(progressPercentage)"
    }
}
