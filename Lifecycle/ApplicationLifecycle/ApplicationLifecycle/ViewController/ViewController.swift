//
//  ViewController.swift
//  ApplicationLifecycle
//
//  Created by Pavel on 30.06.23.
//

import UIKit
import os.log

final class ViewController: UIViewController {
    private let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "ViewControllerLifecycle")
    
    override func loadView() {
        super.loadView()
        logger.log("ViewController: Loading the view.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logger.log("ViewController: View did load.")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        logger.log("ViewController: View will appear. Updating the UI.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logger.log("ViewController: View did appear. Start tracking analytics.")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        logger.log("ViewController: View will disappear. Pausing ongoing tasks.")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        logger.log("ViewController: View did disappear. Stop tracking analytics.")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        logger.log("ViewController: View will layout subviews. Preparing for layout changes.")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logger.log("ViewController: View did layout subviews. Layout changes completed.")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        logger.log("ViewController: Received memory warning. Perform memory cleanup.")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        logger.log("ViewController: View will transition to new size. Adjusting the layout.")
    }
    
    deinit {
        logger.log("ViewController: Deallocating the view controller.")
    }
}
