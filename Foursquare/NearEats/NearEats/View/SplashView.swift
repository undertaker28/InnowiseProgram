//
//  SplashView.swift
//  NearEats
//
//  Created by Pavel on 6.08.23.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            ApplicationSwitcherView()
        } else {
            Image("FoursquareLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 320, height: 320, alignment: .center)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
