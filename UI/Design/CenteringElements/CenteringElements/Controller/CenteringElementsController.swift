//
//  CenteringElementsController.swift
//  CenteringElements
//
//  Created by Pavel on 13.06.23.
//

import UIKit

final class CenteringElementsController: UIViewController {
    var centeringElementsView = CenteringElementsView()

    override func loadView() {
        view = centeringElementsView
    }
}
