//
//  LoginView.swift
//  NearEats
//
//  Created by Pavel on 6.08.23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var userStateViewModel: UserStateViewModel
    @StateObject private var loginViewModel = LoginViewModel()

    var body: some View {
        Button(action: {
            Task {
                await userStateViewModel.logIn()
            }
        }) {
            Text("CONNECT TO FOURSQUARE")
                .font(Font.custom("MarkPro-Bold", size: 16))
                .foregroundColor(.white)
        }
        .buttonStyle(FallingButton())
        .onOpenURL(perform: loginViewModel.handleOpenURL)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
