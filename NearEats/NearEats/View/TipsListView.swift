//
//  TipsListView.swift
//  NearEats
//
//  Created by Pavel on 9.08.23.
//

import SwiftUI

struct TipsListView: View {
    private(set) var tips: [Tip]

    var body: some View {
        ForEach(tips) { tip in
            VStack(alignment: .leading, spacing: 5) {
                Text(tip.text)
                    .font(.system(size: 14))
                Text(tip.created_at.formattedDate() ?? "")
                    .font(.system(size: 14))
                    .frame(maxWidth: .infinity, alignment: .bottomTrailing)
            }
            .padding(.all, 15)
            .background(Color("Background"))
            .cornerRadius(20)
            .shadow(color: Color("Background").opacity(0.2), radius: 2, x: 0, y: 0)
            .padding(.all, 5)
        }
    }
}

struct TipsListView_Previews: PreviewProvider {
    static var previews: some View {
        TipsListView(tips: [Tip(created_at: "2016-03-29T16:44:27.000Z", text: "Периодически ходим и на оперу, и на балет, практически всегда восторг. Особенно понравились \"Щелкунчик\" и \"Летучий голландец \". Рекомендую брать места поближе к сцене и не забывать о шампанском!"), Tip(created_at: "2014-10-19T05:44:05.000Z", text: "После ремонта театр действительно поражает. Сохранив все самое лучшее, добавились яркие современные декорации и костюмы. И да, оперу теперь можно читать! Прямо как в Вене. Из минусов - туалет."),Tip(created_at: "2017-09-17T10:06:33.000Z", text: "Дешевые билеты, красивый зал,вкусная еда в буфете. Минус-слышно суфлеров на опере волшебная флейта 14/09/17, ещё ниразу ни в одном театре разных стран не видела что бы главный актёр забыл слова. Позор"), Tip(created_at: "2016-04-25T18:46:58.000Z", text: "Хорошая акустика, бегущая строка с субтитрами, в теплое время года красивые сквер и фонтан. Балеты Шесть танцев и Маленькая смерть need to see"),Tip(created_at: "2014-09-19T20:52:55.000Z", text: "В зале довольно прохладно.Красавицам в вечерних платьях очень советую взять шаль или подбирать не очень открытый наряд.И будет нам счастье:)"), Tip(created_at: "2014-11-10T20:08:27.000Z", text: "Снаружи красавец! Внутрь не попала-была в джинсах) да ладно, шучу! В те дни, что мы были в Минске не было ничего на что хотелось бы сходить. Просто возмутили сообщения минских театральных снобов(")])
    }
}
