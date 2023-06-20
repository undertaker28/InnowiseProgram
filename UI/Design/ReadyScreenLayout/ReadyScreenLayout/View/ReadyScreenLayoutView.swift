//
//  ReadyScreenLayoutView.swift
//  ReadyScreenLayout
//
//  Created by Pavel on 18.06.23.
//

import UIKit
import SnapKit

final class ReadyScreenLayoutView: UIView {
    private lazy var backgroundPictureView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "AngelinaJolie")
        image.contentMode = .scaleAspectFill
        image.layer.zPosition = -1
        return image
    }()
    
    private lazy var backgroundView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor(named: "Black")
        image.layer.zPosition = -1
        return image
    }()
    
    private lazy var titleTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Model winner of 2018\nTokyo Art costume design\nweek"
        label.numberOfLines = 0
        label.font = UIFont(name: "MarkPro-Bold", size: 25)
        label.textColor = .white
        return label
    }()
    
    lazy var profilePictureView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = Constants.profilePictureWidth / 2
        image.clipsToBounds = true
        return image
    }()
    
    lazy var nameTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 16)
        label.textColor = .white
        return label
    }()
    
    lazy var lastAccessTimeTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 13)
        label.textColor = .gray
        return label
    }()
    
    private lazy var stackViewProfileInfo: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameTextLabel, lastAccessTimeTextLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    private lazy var stackViewProfile: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profilePictureView, stackViewProfileInfo])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var followButton: UIButton = {
        let button = GradientButton(colors: [UIColor(named: "Orange") ?? .orange, UIColor(named: "LightRed") ?? .red])
        let configuration = UIImage.SymbolConfiguration(pointSize: 14, weight: .bold)
        button.setImage(UIImage(systemName: "plus", withConfiguration: configuration), for: .normal)
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 18)
        button.tintColor = .white
        return button
    }()
    
    private lazy var eyeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "eye.fill")
        image.tintColor = UIColor(named: "Gray")
        return image
    }()
    
    lazy var viewingsTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 15)
        label.textColor = .white
        return label
    }()
    
    private lazy var stackViewViewings: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [eyeImage, viewingsTextLabel])
        stackView.axis = .horizontal
        stackView.spacing = 3
        return stackView
    }()
    
    private lazy var commentImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "message.fill")
        image.tintColor = UIColor(named: "Gray")
        return image
    }()
    
    lazy var commentsTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 15)
        label.textColor = .white
        return label
    }()
    
    private lazy var stackViewComments: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [commentImage, commentsTextLabel])
        stackView.axis = .horizontal
        stackView.spacing = 3
        return stackView
    }()
    
    private lazy var heartImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "heart.fill")
        image.tintColor = UIColor(named: "Gray")
        return image
    }()
    
    lazy var likesTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 15)
        label.textColor = .white
        return label
    }()
    
    private lazy var stackViewLikes: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [heartImage, likesTextLabel])
        stackView.axis = .horizontal
        stackView.spacing = 3
        return stackView
    }()
    
    private lazy var stackViewStatistics: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [stackViewViewings, stackViewComments, stackViewLikes])
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var recommendedTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Recommended by :"
        label.font = UIFont(name: "WorkSans-Regular", size: 15)
        label.textColor = .gray
        return label
    }()
    
    lazy var usersTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "WorkSans-Regular", size: 15)
        label.textColor = .gray
        return label
    }()
    
    private lazy var userImage1 = UIImageView().createUserImageView(imageName: "Man")
    private lazy var userImage2 = UIImageView().createUserImageView(imageName: "Man1")
    private lazy var userImage3 = UIImageView().createUserImageView(imageName: "Woman")
    private lazy var userImage4 = UIImageView().createUserImageView(imageName: "Man2")
    
    lazy var numberOfRemainingUsersTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 13)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = UIColor.darkGray.withAlphaComponent(0.6)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        return label
    }()
    
    private lazy var stackViewOfUsers: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userImage1, userImage2, userImage3, userImage4, numberOfRemainingUsersTextLabel])
        stackView.axis = .horizontal
        stackView.spacing = -10
        return stackView
    }()
    
    private lazy var seperatorLineView: UIView = {
        let view = UIStackView()
        view.backgroundColor = .gray.withAlphaComponent(0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.add(subviews: stackViewOfUsers, stackViewStatistics, recommendedTextLabel, usersTextLabel, seperatorLineView, stackViewProfile, followButton, titleTextLabel, backgroundPictureView, backgroundView)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeConstraints() {
        stackViewOfUsers.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(Constants.bottomInset)
            $0.left.equalToSuperview().inset(Constants.inset)
        }
        
        stackViewOfUsers.arrangedSubviews.forEach { userImage in
            userImage.snp.makeConstraints {
                $0.width.height.equalTo(Constants.userImageWidthHeight)
            }
        }
        
        stackViewStatistics.snp.makeConstraints {
            $0.centerY.equalTo(stackViewOfUsers.snp.centerY)
            $0.right.equalToSuperview().inset(Constants.inset)
        }
        
        recommendedTextLabel.snp.makeConstraints {
            $0.bottom.equalTo(stackViewOfUsers.snp.top).inset(-Constants.inset)
            $0.left.equalToSuperview().inset(Constants.inset)
        }
        
        usersTextLabel.snp.makeConstraints {
            $0.centerY.equalTo(recommendedTextLabel.snp.centerY)
            $0.right.equalToSuperview().inset(Constants.inset)
        }
        
        seperatorLineView.snp.makeConstraints {
            $0.bottom.equalTo(recommendedTextLabel.snp.top).inset(-Constants.inset)
            $0.height.equalTo(1)
            $0.left.right.equalToSuperview().inset(Constants.inset)
        }
        
        stackViewProfile.snp.makeConstraints {
            $0.bottom.equalTo(seperatorLineView.snp.top).inset(-Constants.inset)
            $0.left.right.equalToSuperview().inset(Constants.inset)
        }
        
        profilePictureView.snp.makeConstraints {
            $0.height.width.equalTo(Constants.profilePictureWidth)
        }
        
        followButton.snp.makeConstraints {
            $0.centerY.equalTo(profilePictureView.snp.centerY)
            $0.right.equalToSuperview().inset(Constants.inset)
            $0.width.equalTo(Constants.followButtonWidth)
            $0.height.equalTo(Constants.followButtonHeight)
        }
        
        titleTextLabel.snp.makeConstraints {
            $0.bottom.equalTo(profilePictureView.snp.top).inset(-Constants.inset)
            $0.left.equalToSuperview().inset(Constants.inset)
        }
        
        backgroundView.snp.makeConstraints {
            $0.top.equalTo(titleTextLabel.snp.centerY)
            $0.left.right.bottom.equalToSuperview()
        }
        
        backgroundPictureView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.bottom.equalTo(backgroundView.snp.top)
        }
    }
}
