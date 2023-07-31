//
//  AnimeDataGenerator.swift
//  WorkWithLists
//
//  Created by Pavel on 30.07.23.
//

import UIKit

final class AnimeDataGenerator {    
    private let animeCoverImageNames = ["Bucket List of the Dead", "Bleach: Thousand-Year Blood War", "Sorcery Fight", "Demon Slayer: Entertainment District Arc", "Link Click", "Attack on Titan", "Hell's Paradise", "Idol of Child", "Chainsaw Man", "The Town Where Only I am Missing"]

    private let animeTitles: [[String: String]] = [
        ["ru": "Предсмертный список зомби", "jp": "Zom 100: Zombie ni Naru made ni Shitai 100 no Koto"],
        ["ru": "Блич: Тысячелетняя кровавая война", "jp": "Bleach: Sennen Kessen-hen"],
        ["ru": "Магическая битва 2", "jp": "Jujutsu Kaisen 2nd Season"],
        ["ru": "Клинок, рассекающий демонов: Квартал красных фонарей", "jp": "Kimetsu no Yaiba: Yuukaku-hen"],
        ["ru": "Агент времени", "jp": "Shiguang Daili Ren"],
        ["ru": "Атака титанов", "jp": "Shingeki no Kyojin"],
        ["ru": "Адский рай", "jp": "Jigokuraku"],
        ["ru": "Звёздное дитя", "jp": "Oshi no Ko"],
        ["ru": "Человек-бензопила", "jp": "Chensō Man"],
        ["ru": "Город, в котором меня нет", "jp": "Boku dake ga Inai Machi"]
    ]
    
    private let animeRatings: [Double] = [9.5, 9.5, 9.5, 9.5, 9.5, 9.4, 9.4, 9.4, 9.4, 9.3]
    
    private let animeSeasons: [String] = ["Лето 2023", "Осень 2022", "Лето 2023", "Зима 2021", "Весна 2021", "Весна 2013", "Весна 2023", "Весна 2023", "Осень 2022", "Зима 2016"]
    
    func generateAnimeData(count: Int) -> [Anime] {
        var animeData: [Anime] = []
        
        for index in 0..<count {
            guard let coverImage = UIImage(named: animeCoverImageNames[index]) else {
                fatalError("Failed to load anime cover image for index \(index)")
            }
            let titles = animeTitles[index]
            let rating = animeRatings[index]
            let season = animeSeasons[index % animeSeasons.count]
            
            let animeInfo = Anime(coverImage: coverImage, titles: titles, rating: rating, season: season)
            animeData.append(animeInfo)
        }
        
        return animeData
    }
}
