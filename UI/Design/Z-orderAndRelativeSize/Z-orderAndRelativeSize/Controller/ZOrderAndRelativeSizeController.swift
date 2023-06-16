//
//  ZOrderAndRelativeSizeController.swift
//  Z-orderAndRelativeSize
//
//  Created by Pavel on 16.06.23.
//

import UIKit

final class ZOrderAndRelativeSizeController: UIViewController {
    var zOrderAndRelativeSizeView = ZOrderAndRelativeSizeView()
    
    override func loadView() {
        view = zOrderAndRelativeSizeView
    }
}
