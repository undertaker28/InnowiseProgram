//
//  UIImageView+Ex.swift
//  ReadyScreenLayout
//
//  Created by Pavel on 19.06.23.
//

import SnapKit

extension UIImageView {
    func createUserImageView(imageName: String) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: imageName)
        image.tintColor = .gray
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 15
        return image
    }
}
