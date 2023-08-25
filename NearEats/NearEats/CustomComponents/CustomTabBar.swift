//
//  CustomTabBar.swift
//  NearEats
//
//  Created by Pavel on 6.08.23.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case search = "magnifyingglass"
    case profile = "person"
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    private var tabColor: Color {
        switch selectedTab {
        case .search:
            return .blue
        case .profile:
            return .indigo
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: tab.rawValue)
                        .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                        .foregroundColor(tab == selectedTab ? tabColor : .gray)
                        .font(.system(size: 25))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(.thinMaterial)
            .cornerRadius(20)
            .padding()
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.search))
    }
}
