//
//  ProfileDataGenerator.swift
//  ReadyScreenLayout
//
//  Created by Pavel on 21.08.23.
//

import Foundation

final class ProfileDataGenerator {
    private let maleImages = ["Man", "Man1", "Man2"]
    private let femaleImages = ["Woman"]
    private let maleNames = ["Brendan", "Oscar", "Ryann", "Victor", "Rex", "Luis", "Bruce"]
    private let femaleNames = ["Celia", "Diana", "Cara", "Emily", "Sophia", "Olivia", "Ava", "Emma"]
    private let lastNames = ["Blackburn", "Willis", "Moore", "Long", "Hancock", "McPherson", "Frank", "Walter", "Keith", "Beil"]
    
    func generateRandomProfiles(count: Int) -> [Profile] {
        var profiles: [Profile] = []
        
        for id in 1...count {
            let isMale = Bool.random()
            let name = generateRandomName(isMale: isMale)
            let profileImage = generateRandomProfileImage(isMale: isMale)
            let lastAccessTime = Int.random(in: 1...24)
            let numberOfRecommendedUsers = Int.random(in: 10...90)
            let numberOfAllUsers = Int.random(in: 70...90)
            let numberOfViewings = Int.random(in: 1000...3000)
            let numberOfMessages = Int.random(in: 100...500)
            let numberOfLikes = Int.random(in: 500...1000)
            let numberOfRemainingUsers = Int.random(in: 20...70)
            
            let profile = Profile(id: id,
                                  name: name,
                                  profileImage: profileImage,
                                  lastAccessTime: lastAccessTime,
                                  numberOfRecommendedUsers: numberOfRecommendedUsers,
                                  numberOfAllUsers: numberOfAllUsers,
                                  numberOfViewings: numberOfViewings,
                                  numberOfMessages: numberOfMessages,
                                  numberOfLikes: numberOfLikes,
                                  numberOfRemainingUsers: numberOfRemainingUsers)
            
            profiles.append(profile)
        }
        
        return profiles
    }
    
    private func generateRandomName(isMale: Bool) -> String {
        let randomFirstName = isMale ? maleNames.randomElement() ?? "Unknown" : femaleNames.randomElement() ?? "Unknown"
        let randomLastName = lastNames.randomElement() ?? "Unknown"
        
        return "\(randomFirstName) \(randomLastName)"
    }
    
    private func generateRandomProfileImage(isMale: Bool) -> String {
        let imageArray = isMale ? maleImages : femaleImages
        return imageArray.randomElement() ?? "User"
    }
}
