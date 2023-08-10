//
//  ApplicationSwitcherView.swift
//  NearEats
//
//  Created by Pavel on 6.08.23.
//

import SwiftUI

struct ApplicationSwitcherView: View {
    @EnvironmentObject private var userStateViewModel: UserStateViewModel
    private let userDefaultsHelper = UserDefaultsHelper()
    
    var body: some View {
        if userDefaultsHelper.getToken() != nil {
            MainView()
                .transition(.slide.animation(.easeInOut(duration: 1)))
        } else {
            LoginView()
                .transition(.slide.animation(.easeInOut(duration: 1)))
        }
    }
}
