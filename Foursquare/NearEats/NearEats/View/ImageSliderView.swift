//
//  ImageSliderView.swift
//  NearEats
//
//  Created by Pavel on 9.08.23.
//

import SwiftUI

struct ImageSliderView: View {
    var photos: [Photo]

    var body: some View {
        TabView {
            ForEach(photos) { photo in
                AsyncImage(
                    url: URL(string: photo.prefix + "original" + photo.suffix)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Image(systemName: "photo.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.gray)
                    }
            }
        }
        .frame(width: 300, height: 300)
        .cornerRadius(30)
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .tabViewStyle(PageTabViewStyle())
    }
}

struct ImageSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSliderView(photos: [Photo(created_at: "2013-05-03T16:15:39.000Z", prefix: "https://fastly.4sqi.net/img/general/", suffix: "/16775595_oEwVx3lhmKICa2QHX2yHn8UFcyNj9vji-QpzmX_FA-Y.jpg", width: 1920, height: 1440), Photo(created_at: "2015-04-25T14:06:49.000Z", prefix: "https://fastly.4sqi.net/img/general/", suffix: "/45970827_5-uPOPZ-liNl6zmKxLJXWP3fwg-5EQaL6qFjiZ1E8wE.jpg", width: 1440, height: 1920), Photo(created_at: "2023-07-29T15:32:30.000Z", prefix: "https://fastly.4sqi.net/img/general/", suffix: "/87560454_UCIuCAvSiRcc0Yuo_TCyN9uuYFywrBWH4mnO6hjYaSw.jpg", width: 1439, height: 1920)])
    }
}
