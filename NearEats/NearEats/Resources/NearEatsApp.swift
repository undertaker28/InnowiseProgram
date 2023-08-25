//
//  NearEatsApp.swift
//  NearEats
//
//  Created by Pavel on 6.08.23.
//

import SwiftUI

@main
struct NearEatsApp: App {
    @StateObject private var userStateViewModel = UserStateViewModel(userDefaultsHelper: UserDefaultsHelperImpl(), fileSystemService: FileSystemServiceImpl())
    @StateObject private var networkMonitor = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(userStateViewModel)
                .environmentObject(networkMonitor)
        }
    }
}
