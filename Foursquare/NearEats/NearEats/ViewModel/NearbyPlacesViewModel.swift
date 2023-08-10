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
    private let fileSystemService = FileSystemService()
    
    func getNearbyPlaces(isConnected: Bool) {
        if isConnected {
            NetworkingService.download(url: Endpoint.places.path, headers: Endpoint.places.headers, parameters: Endpoint.places.parameters)
                .decode(type: Root.self, decoder: JSONDecoder())
                .sink(receiveCompletion: NetworkingService.handleCompletion, receiveValue: { [weak self] nearbyPlacesList in
                    self?.nearbyPlacesList = nearbyPlacesList.results
                    self?.fileSystemService.savePlaces(nearbyPlacesList.results)
                })
                .store(in: &cancellables)
        } else {
            nearbyPlacesList = fileSystemService.fetchPlaces()
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
