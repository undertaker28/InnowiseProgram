//
//  FileSystemService.swift
//  NearEats
//
//  Created by Pavel on 9.08.23.
//

import Foundation

protocol FileSystemService {
    func save<T: Codable>(_ data: [T], toDictionaryWithKey key: String)
    func fetch<T: Codable>(fromDictionaryWithKey key: String) -> [T]
    func deleteAllFiles()
}

final class FileSystemServiceImpl: FileSystemService {
    private let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    func save<T: Codable>(_ data: [T], toDictionaryWithKey key: String) {
        var decodedArray: [T] = fetch(fromDictionaryWithKey: key)

        decodedArray.append(contentsOf: data)

        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(decodedArray) {
            let url = documentsPath.appendingPathComponent("\(key).json")
            do {
                try encodedData.write(to: url)
                print("\(key) saved successfully")
            } catch {
                print("Error saving \(key): \(error)")
            }
        }
    }

    func fetch<T: Codable>(fromDictionaryWithKey key: String) -> [T] {
        let url = documentsPath.appendingPathComponent("\(key).json")
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedArray = try decoder.decode([T].self, from: data)
            return decodedArray
        } catch {
            print("Error fetching \(key): \(error)")
        }
        return []
    }
    
    func deleteAllFiles() {
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: documentsPath, includingPropertiesForKeys: nil, options: [])
            
            for fileURL in fileURLs {
                if fileURL.pathExtension == "json" {
                    do {
                        try FileManager.default.removeItem(at: fileURL)
                        print("\(fileURL) deleted successfully")
                    } catch {
                        print("Error deleting \(fileURL): \(error)")
                    }
                }
            }
        } catch {
            print("Error listing files in documents directory: \(error)")
        }
    }
}
