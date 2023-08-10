//
//  ProfileView.swift
//  NearEats
//
//  Created by Pavel on 6.08.23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var userStateViewModel: UserStateViewModel
    
    var body: some View {        
        Button(action: {
            Task {
                await userStateViewModel.logOut()
            }
        }) {
            Text("LOGOUT")
                .font(Font.custom("MarkPro-Bold", size: 16))
                .foregroundColor(.white)
        }
        .buttonStyle(FallingButton())
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
