//
//  MainView.swift
//  NearEats
//
//  Created by Pavel on 6.08.23.
//

import SwiftUI

struct MainView: View {
    @State private var tabSelected: Tab = .search
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $tabSelected) {
                NearbyPlacesView()
                    .tag(Tab.search)
                    .animation(nil, value: tabSelected)
                
                ProfileView()
                    .tag(Tab.profile)
                    .animation(nil, value: tabSelected)
            }
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $tabSelected)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
