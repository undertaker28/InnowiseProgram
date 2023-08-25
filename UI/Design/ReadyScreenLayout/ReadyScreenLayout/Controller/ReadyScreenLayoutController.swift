//
//  ReadyScreenLayoutController.swift
//  ReadyScreenLayout
//
//  Created by Pavel on 18.06.23.
//

import UIKit

final class ReadyScreenLayoutController: UIViewController {    
    private var readyScreenLayoutView = ReadyScreenLayoutView()
    private var currentIndex = 0
    private var realIndex = 0
    private var timer: Timer?
    private lazy var profiles = ProfileDataGenerator().generateRandomProfiles(count: Constants.numberOfProfilesToGenerate)
    
    override func loadView() {
        view = readyScreenLayoutView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopTimer()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(updateView), userInfo: nil, repeats: true)
        timer?.fire()
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func updateView() {
        currentIndex += 1
        realIndex = currentIndex % profiles.count
        readyScreenLayoutView.nameTextLabel.text = profiles[realIndex].name
        readyScreenLayoutView.profilePictureView.image = UIImage(named: profiles[realIndex].profileImage)
        readyScreenLayoutView.lastAccessTimeTextLabel.text = "\(profiles[realIndex].lastAccessTime)" + " Days Ago"
        readyScreenLayoutView.usersTextLabel.text = "\(profiles[realIndex].numberOfRecommendedUsers)" + " / " + "\(profiles[realIndex].numberOfAllUsers)"
        readyScreenLayoutView.viewingsTextLabel.text = "\(profiles[realIndex].numberOfViewings)"
        readyScreenLayoutView.commentsTextLabel.text = "\(profiles[realIndex].numberOfMessages)"
        readyScreenLayoutView.likesTextLabel.text = "\(profiles[realIndex].numberOfLikes)"
        readyScreenLayoutView.numberOfRemainingUsersTextLabel.text = "+\(profiles[realIndex].numberOfRemainingUsers)"
    }
    
    private func configureItems() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .white
    }
}
