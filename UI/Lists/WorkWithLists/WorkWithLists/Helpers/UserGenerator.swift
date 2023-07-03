//
//  UserGenerator.swift
//  WorkWithLists
//
//  Created by Pavel on 2.07.23.
//

import Foundation

final class UserGenerator {
    private let maleFirstNames = ["John", "Michael", "Robert", "William", "David", "James", "Joseph", "Daniel", "Matthew", "Andrew"]
    private let femaleFirstNames = ["Emma", "Sophia", "Olivia", "Isabella", "Ava", "Mia", "Emily", "Charlotte", "Amelia", "Grace"]
    let lastNames = ["Smith", "Johnson", "Williams", "Brown", "Jones", "Davis", "Miller", "Wilson", "Moore", "Taylor", "Anderson", "Thomas", "Jackson", "White", "Harris", "Martin", "Thompson", "Garcia", "Martinez", "Robinson", "Clark", "Rodriguez", "Lewis", "Lee", "Walker", "Hall", "Allen", "Young", "King", "Wright", "Lopez"]
    private let sexes = ["Male", "Female"]
    private let avatarUrl = URL(string: "https://image.cnbcfm.com/api/v1/image/105773423-1551716977818rtx6p9yw.jpg?v=1551717428&w=700&h=700")!
    private let descriptions = [
        "I love hiking and exploring new places.", "Passionate about photography and capturing beautiful moments.",
        "Enjoys reading books and writing poetry.", "Loves cooking and experimenting with new recipes.",
        "Sports enthusiast, especially basketball and swimming.", "Tech geek, always excited about the latest gadgets.",
        "Avid traveler, always seeking new adventures.", "Passionate about volunteering and making a difference in the community."
    ]
    
    func generateUsers(count: Int) -> [User] {
        var users: [User] = []
        
        for _ in 1...count {
            let sex = sexes.randomElement() ?? ""
            let firstName = generateFirstName(for: sex)
            let lastName = lastNames.randomElement() ?? ""
            let age = Int.random(in: 18...60)
            let description = generateDescription()
            
            let user = User(firstName: firstName, lastName: lastName, age: age, sex: sex, squareAvatarUrl: avatarUrl, description: description)
            users.append(user)
        }
        
        return users
    }
    
    private func generateDescription() -> [String] {
        let numberOfLines = Int.random(in: 1...3)
        var uniqueLines: Set<String> = []
        
        while uniqueLines.count < numberOfLines {
            let randomLine = descriptions.randomElement() ?? ""
            uniqueLines.insert(randomLine)
        }
        
        return Array(uniqueLines)
    }
    
    private func generateFirstName(for sex: String) -> String {
        if sex == "Male" {
            return maleFirstNames.randomElement() ?? "Mike"
        } else {
            return femaleFirstNames.randomElement() ?? "Eva"
        }
    }
}
