//
//  NearbyPlacesViewModel.swift
//  NearEats
//
//  Created by Pavel on 7.08.23.
//

import Foundation
import Combine

final class NearbyPlacesViewModel: ObservableObject {
    @Published private(set) var nearbyPlacesList: [Place] = []
    private var cancellables = Set<AnyCancellable>()
    private let fileSystemService: FileSystemService
    private let networkingService: NetworkingService

    init(fileSystemService: FileSystemService, networkingService: NetworkingService) {
        self.fileSystemService = fileSystemService
        self.networkingService = networkingService
    }
    
    func getNearbyPlaces(isConnected: Bool) {
        if isConnected {
            networkingService.download(url: Endpoint.places.path, headers: Endpoint.places.headers, parameters: Endpoint.places.parameters)
                .decode(type: Response.self, decoder: JSONDecoder())
                .sink(receiveCompletion: networkingService.handleCompletion, receiveValue: { [weak self] nearbyPlacesList in
                    self?.nearbyPlacesList = nearbyPlacesList.results
                    self?.fileSystemService.save(nearbyPlacesList.results, toDictionaryWithKey: "AllPlaces")
                })
                .store(in: &cancellables)
        } else {
            nearbyPlacesList = fileSystemService.fetch(fromDictionaryWithKey: "AllPlaces")
        }
    }
    
    func getURLImage(place: Place) -> URL? {
        if let category = place.categories.first,
           let url = URL(string: category.icon.prefix + "bg_88" + category.icon.suffix) {
            return url
        }
        return nil
    }
    
    func getFilteredPlaces(searchText: String) -> [Place] {
        return searchText.isEmpty ? nearbyPlacesList : nearbyPlacesList.filter { $0.name.contains(searchText.lowercased()) }
    }
}
