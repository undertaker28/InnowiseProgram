//
//  NoResultsView.swift
//  NearEats
//
//  Created by Pavel on 10.08.23.
//

import SwiftUI

struct NoResultsView: View {
    var body: some View {
        VStack {
            Image("NoResults")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 160, height: 160)
            
            Text("No Results")
                .font(Font.custom("MarkPro-Bold", size: 26))
        }
    }
}

struct NoResultsView_Previews: PreviewProvider {
    static var previews: some View {
        NoResultsView()
    }
}
