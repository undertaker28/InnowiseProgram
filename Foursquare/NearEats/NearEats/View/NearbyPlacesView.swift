//
//  NearbyPlacesView.swift
//  NearEats
//
//  Created by Pavel on 6.08.23.
//

import SwiftUI

struct NearbyPlacesView: View {
    @StateObject private var nearbyPlacesViewModel = NearbyPlacesViewModel()
    @State private var isLoading = true
    @State private var searchText = ""
    @EnvironmentObject private var networkMonitor: NetworkMonitor
    
    var body: some View {
        NavigationView {
            if nearbyPlacesViewModel.getFilteredPlaces(searchText: searchText).isEmpty && !searchText.isEmpty {
                NoResultsView()
            } else {
                List(nearbyPlacesViewModel.getFilteredPlaces(searchText: searchText)) { place in
                    HStack {
                        NavigationLink(destination: DetailNearbyPlacesView(placeDetail: place)) {
                            AsyncImage(
                                url: nearbyPlacesViewModel.getURLImage(place: place)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                } placeholder: {
                                    Image(systemName: "photo.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(.gray)
                                }
                                .frame(width: 70, height: 70)
                            
                            VStack {
                                Text(place.name)
                                    .font(Font.custom("MarkPro-Bold", size: 14))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(Color("DarkBlue"))
                                    .padding(.bottom, 3)
                                
                                Text(place.categories.first?.name ?? "No category")
                                    .font(Font.custom("MarkPro-Bold", size: 13))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(Color("Pink"))
                            }
                            .padding()
                        }
                    }
                }
            }
        }
        .searchable(text: $searchText)
        .navigationBarTitle("Nearby Places")
        .onAppear {
            if isLoading {
                nearbyPlacesViewModel.getNearbyPlaces(isConnected: networkMonitor.isConnected)
                isLoading = false
            }
        }
    }
}

struct NearbyPlacesView_Previews: PreviewProvider {
    static var previews: some View {
        NearbyPlacesView()
    }
}
