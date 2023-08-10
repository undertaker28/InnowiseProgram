//
//  DetailNearbyPlacesView.swift
//  NearEats
//
//  Created by Pavel on 8.08.23.
//

import SwiftUI

struct DetailNearbyPlacesView: View {
    @StateObject private var detailNearbyPlacesViewModel = DetailNearbyPlacesViewModel()
    var placeDetail: Place
    @EnvironmentObject private var networkMonitor: NetworkMonitor
    
    var body: some View {
        VStack {
            ImageSliderView(photos: detailNearbyPlacesViewModel.photosList)
            ZStack {
                Color(.systemGray6).edgesIgnoringSafeArea(.bottom)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(placeDetail.name)
                            .font(Font.custom("MarkPro-Bold", size: 20))
                            .foregroundColor(Color("DarkBlue"))
                            .padding(.top, 5)
                        
                        infoRow(firstText: "Type: ", secondText: placeDetail.categories.first?.name ?? "No type", fontName: "MarkPro-Bold", fontSize: 15, colorForFirstText: "Pink")
                        infoRow(firstText: "Address: ", secondText: placeDetail.location.address ?? "No address", fontName: "MarkPro-Bold", fontSize: 15, colorForFirstText: "Pink")
                        infoRow(firstText: "Distance: ", secondText: "\(Int(round(placeDetail.distance))) м", fontName: "MarkPro-Bold", fontSize: 15, colorForFirstText: "Pink")
                        
                        Text("Tips")
                            .font(Font.custom("MarkPro-Bold", size: 20))
                            .foregroundColor(Color("DarkBlue"))
                        
                        TipsListView(tips: detailNearbyPlacesViewModel.tipsList)
                    }
                    .padding(.top, 5)
                    .padding([.leading, .trailing], 15)
                    .padding(.bottom, 80)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .onAppear {
            detailNearbyPlacesViewModel.getPhotosList(fsq_id: placeDetail.fsq_id, isConnected: networkMonitor.isConnected)
            detailNearbyPlacesViewModel.getTipsList(fsq_id: placeDetail.fsq_id, isConnected: networkMonitor.isConnected)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailNearbyPlacesView_Previews: PreviewProvider {
    static var previews: some View {
        DetailNearbyPlacesView(placeDetail: Place(fsq_id: "4ca211aa0313370428b488d5", categories: [Category(id: 10042, name: "Оперный театр", icon: Icon(prefix: "https://ss3.4sqi.net/img/categories_v2/arts_entertainment/performingarts_operahouse_", suffix: ".png"))], distance: 550.0, location: Location(address: Optional("пл. Парижской коммуны, 1"), address_extended: nil, census_block: nil, country: "BY", dma: nil, formatted_address: "пл. Парижской коммуны, 1, Мінск, 220029", locality: Optional("Мінск"), postcode: Optional("220029"), region: Optional("Мінск")), name: "Национальный академический Большой театр оперы и балета (Нацыянальны акадэмічны Вялікі тэатр оперы і балета)"))
    }
}
