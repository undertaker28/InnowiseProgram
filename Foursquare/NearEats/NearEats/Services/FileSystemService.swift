//
//  FileSystemService.swift
//  NearEats
//
//  Created by Pavel on 9.08.23.
//

import Foundation

final class FileSystemService {
    private let dataSourceURLForPlaces: URL
    private let dataSourceURLForTips: URL
    private let dataSourceURLForPhotos: URL
    
    init() {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        dataSourceURLForPlaces = documentsPath.appendingPathComponent("Places.json")
        dataSourceURLForTips = documentsPath.appendingPathComponent("Tips.json")
        dataSourceURLForPhotos = documentsPath.appendingPathComponent("Photos.json")
    }
    
    func savePlaces(_ places: [Place]) {
        let encoder = JSONEncoder()
        let placesData = try? encoder.encode(places)
        if let placesData = placesData {
            do {
                try placesData.write(to: dataSourceURLForPlaces)
                print("Places saved successfully")
            } catch {
                print("Error saving places: \(error)")
            }
        }
    }
    
    func fetchPlaces() -> [Place] {
        do {
            let placesData = try Data(contentsOf: dataSourceURLForPlaces)
            let decoder = JSONDecoder()
            let places = try decoder.decode([Place].self, from: placesData)
            return places
        } catch {
            print("Error fetching places: \(error)")
            return []
        }
    }
    
    func saveTips(forPlaceId placeId: String, tips: [Tip]) {
        var tipsDictionary = fetchTipsDictionary()
        tipsDictionary[placeId] = tips
        saveTipsDictionary(tipsDictionary)
    }
    
    func fetchTips(forPlaceId placeId: String) -> [Tip] {
        let tipsDictionary = fetchTipsDictionary()
        return tipsDictionary[placeId] ?? []
    }
    
    func savePhotos(forPlaceId placeId: String, photos: [Photo]) {
        var photosDictionary = fetchPhotosDictionary()
        photosDictionary[placeId] = photos
        savePhotosDictionary(photosDictionary)
    }
    
    func fetchPhotos(forPlaceId placeId: String) -> [Photo] {
        let photosDictionary = fetchPhotosDictionary()
        return photosDictionary[placeId] ?? []
    }
    
    private func fetchTipsDictionary() -> [String: [Tip]] {
        do {
            let tipsData = try Data(contentsOf: dataSourceURLForTips)
            let decoder = JSONDecoder()
            let tipsDictionary = try decoder.decode([String: [Tip]].self, from: tipsData)
            return tipsDictionary
        } catch {
            return [:]
        }
    }
    
    private func saveTipsDictionary(_ tipsDictionary: [String: [Tip]]) {
        let encoder = JSONEncoder()
        if let tipsData = try? encoder.encode(tipsDictionary) {
            do {
                try tipsData.write(to: dataSourceURLForTips)
            } catch {
                print("Error saving tips dictionary: \(error)")
            }
        }
    }

    private func fetchPhotosDictionary() -> [String: [Photo]] {
        do {
            let photosData = try Data(contentsOf: dataSourceURLForPhotos)
            let decoder = JSONDecoder()
            let photosDictionary = try decoder.decode([String: [Photo]].self, from: photosData)
            return photosDictionary
        } catch {
            return [:]
        }
    }
    
    private func savePhotosDictionary(_ photosDictionary: [String: [Photo]]) {
        let encoder = JSONEncoder()
        if let photosData = try? encoder.encode(photosDictionary) {
            do {
                try photosData.write(to: dataSourceURLForPhotos)
            } catch {
                print("Error saving photos dictionary: \(error)")
            }
        }
    }
    
    func deleteAllFiles() {
        let fileURLs = [dataSourceURLForPlaces, dataSourceURLForTips, dataSourceURLForPhotos]
        
        for fileURL in fileURLs {
            do {
                try FileManager.default.removeItem(at: fileURL)
                print("\(fileURL) deleted successfully")
            } catch {
                print("Error deleting \(fileURL): \(error)")
            }
        }
    }
}
