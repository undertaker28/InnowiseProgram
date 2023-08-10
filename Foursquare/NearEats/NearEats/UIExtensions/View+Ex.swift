//
//  View+Ex.swift
//  NearEats
//
//  Created by Pavel on 8.08.23.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(CustomCornerShape(radius: radius, corners: corners))
    }
    
    func infoRow(firstText: String, secondText: String, fontName: String, fontSize: CGFloat, colorForFirstText: String) -> some View {
        HStack {
            Text(firstText)
                .font(Font.custom(fontName, size: fontSize))
                .foregroundColor(Color(colorForFirstText))
            
            Text(secondText)
                .font(Font.custom(fontName, size: fontSize))
        }
    }
}
