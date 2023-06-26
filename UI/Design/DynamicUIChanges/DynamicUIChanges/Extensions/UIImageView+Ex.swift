//
//  UIImageView+Ex.swift
//  DynamicUIChanges
//
//  Created by Pavel on 26.06.23.
//

import UIKit

extension UIImageView {
    func createImageView(imageName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
}
