//
//  ScrollViewController.swift
//  ScrollView
//
//  Created by Pavel on 15.06.23.
//

import UIKit

final class ScrollViewController: UIViewController {
    var scrollView = ScrollView()
    
    override func loadView() {
        view = scrollView
    }
}
