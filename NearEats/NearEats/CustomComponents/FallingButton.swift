//
//  FallingButton.swift
//  NearEats
//
//  Created by Pavel on 6.08.23.
//

import SwiftUI

struct FallingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color("DarkBlue"))
            .foregroundStyle(.white)
            .cornerRadius(5)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
