//
//  PipetteAndZOrderController.swift
//  PipetteAndZ-order
//
//  Created by Pavel on 17.06.23.
//

import UIKit

final class PipetteAndZOrderController: UIViewController {
    var pipetteAndZOrderView = PipetteAndZOrderView()
    
    override func loadView() {
        view = pipetteAndZOrderView
    }
}
