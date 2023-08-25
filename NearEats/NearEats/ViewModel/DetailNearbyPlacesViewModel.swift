//
//  DetailNearbyPlacesViewModel.swift
//  NearEats
//
//  Created by Pavel on 8.08.23.
//

import Foundation
import Combine

final class DetailNearbyPlacesViewModel: ObservableObject {
    @Published private(set) var tipsList: [Tip] = []
    @Published private(set) var photosList: [Photo] = []
    private var cancellables = Set<AnyCancellable>()
    private let fileSystemService: FileSystemService
    private let networkingService: NetworkingService

    init(fileSystemService: FileSystemService, networkingService: NetworkingService) {
        self.fileSystemService = fileSystemService
        self.networkingService = networkingService
    }
    
    func getTipsList(fsq_id: String, isConnected: Bool) {
        if isConnected {
            let endpointTips = Endpoint.tips(fsq_id: fsq_id)
            networkingService.download(url: endpointTips.path, headers: endpointTips.headers, parameters: endpointTips.parameters)
                .decode(type: [Tip].self, decoder: JSONDecoder())
                .sink(receiveCompletion: networkingService.handleCompletion, receiveValue: { [weak self] tipsList in
                    self?.tipsList = tipsList
                    self?.fileSystemService.save(tipsList, toDictionaryWithKey: "Tips: " + fsq_id)
                })
                .store(in: &cancellables)
        } else {
            tipsList = fileSystemService.fetch(fromDictionaryWithKey: "Tips: " + fsq_id)
        }
    }
    
    func getPhotosList(fsq_id: String, isConnected: Bool) {
        if isConnected {
            let endpointPhotos = Endpoint.photos(fsq_id: fsq_id)
            networkingService.download(url: endpointPhotos.path, headers: endpointPhotos.headers, parameters: endpointPhotos.parameters)
                .decode(type: [Photo].self, decoder: JSONDecoder())
                .sink(receiveCompletion: networkingService.handleCompletion, receiveValue: { [weak self] photosList in
                    self?.photosList = photosList
                    self?.fileSystemService.save(photosList, toDictionaryWithKey: "Photos: " + fsq_id)
                })
                .store(in: &cancellables)
        } else {
            photosList = fileSystemService.fetch(fromDictionaryWithKey: "Photos: " + fsq_id)
        }
    }
}
