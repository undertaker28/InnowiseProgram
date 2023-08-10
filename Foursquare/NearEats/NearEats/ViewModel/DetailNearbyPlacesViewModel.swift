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
    private let fileSystemService = FileSystemService()
    
    func getTipsList(fsq_id: String, isConnected: Bool) {
        if isConnected {
            let endpointTips = Endpoint.tips(fsq_id: fsq_id)
            NetworkingService.download(url: endpointTips.path, headers: endpointTips.headers, parameters: endpointTips.parameters)
                .decode(type: [Tip].self, decoder: JSONDecoder())
                .sink(receiveCompletion: NetworkingService.handleCompletion, receiveValue: { [weak self] tipsList in
                    self?.tipsList = tipsList
                    self?.fileSystemService.saveTips(forPlaceId: fsq_id, tips: tipsList)
                })
                .store(in: &cancellables)
        } else {
            tipsList = fileSystemService.fetchTips(forPlaceId: fsq_id)
        }
    }
    
    func getPhotosList(fsq_id: String, isConnected: Bool) {
        if isConnected {
            let endpointPhotos = Endpoint.photos(fsq_id: fsq_id)
            NetworkingService.download(url: endpointPhotos.path, headers: endpointPhotos.headers, parameters: endpointPhotos.parameters)
                .decode(type: [Photo].self, decoder: JSONDecoder())
                .sink(receiveCompletion: NetworkingService.handleCompletion, receiveValue: { [weak self] photosList in
                    self?.photosList = photosList
                    self?.fileSystemService.savePhotos(forPlaceId: fsq_id, photos: photosList)
                })
                .store(in: &cancellables)
        } else {
            photosList = fileSystemService.fetchPhotos(forPlaceId: fsq_id)
        }
    }
}
