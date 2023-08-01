//
//  ChronometerViewController.swift
//  Chronometer
//
//  Created by Pavel on 1.08.23.
//

import UIKit
import SnapKit

final class ChronometerViewController: UIViewController {
    private lazy var sessionDurationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 22)
        label.textColor = .black
        return label
    }()
    
    private var firstThread: Thread?
    private var secondThread: Thread?
    private var thirdThread: Thread?

    private var sessionDuration = 0
    private var toastCount = 0
    private var toastText = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        startThreads()
        view.add(subviews: sessionDurationLabel)
        makeConstraints()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopThreads()
    }
    
    private func startThreads() {
        firstThread = Thread(target: self, selector: #selector(updateSessionDurationLabel), object: nil)
        firstThread?.start()

        secondThread = Thread(target: self, selector: #selector(showToast), object: nil)
        secondThread?.start()

        thirdThread = Thread(target: self, selector: #selector(updateToastText), object: nil)
        thirdThread?.start()
    }
    
    private func stopThreads() {
        firstThread?.cancel()
        secondThread?.cancel()
        thirdThread?.cancel()
    }

    @objc private func updateSessionDurationLabel() {
        while true {
            DispatchQueue.main.async {
                self.sessionDuration += 1
                self.sessionDurationLabel.text = "\(self.sessionDuration) seconds"
            }

            Thread.sleep(forTimeInterval: 1)
        }
    }

    @objc private func showToast() {
        while true {
            if sessionDuration > 0 {
                self.toastCount += 1
            
                DispatchQueue.main.async {
                    self.showToastMessage(self.toastText)
                }
            }
            
            Thread.sleep(forTimeInterval: 10)
        }
    }

    private func showToastMessage(_ message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        present(alertController, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                alertController.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @objc private func updateToastText() {
        while true {
            if self.toastCount % 4 == 0 {
                self.toastText = "Surprise"
            } else {
                self.toastText = "\(self.sessionDuration) seconds"
            }
        }
    }
    
    private func makeConstraints() {
        sessionDurationLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
