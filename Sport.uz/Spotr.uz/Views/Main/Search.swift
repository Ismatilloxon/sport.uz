//
//  Search.swift
//  Spotr.uz
//
//  Created by mac on 03/12/21.
//

import SwiftUI

struct Search: View {
    @State var searchText = ""
    @State var controlIndex = 0
    @State var musobaqalar = ["10 - 17 mart Xorazim" : "17 yoshgacha bo'lganlar o'rtasida O'zbekiston chempionati","23 - 30 mart namangan" : "15 yoshgacha bo'lganlar o'rtasida O'zbekiston chempionati","10 - 17 aprel Toshkent" : "O'zbekiston kubogi","1 - 5 may Namangan" : "21 yoshgacha bo'lganlar o'rtasida O'zbekiston chempionati","20 - 27 may Jizzax" : "24 yoshgacha bo'lganlar o'rtasida O'zbekiston chempionati","1 - 4 iyyun Farg'ona" : "19 yoshgacha bo'lganlar o'rtasida O'zbekiston chempionati","11 - 18 iyyul Nukus" : "14 yoshgacha bo'lganlar o'rtasida O'zbekiston chempionati","1 - 8 sentabr Andijon" : "20 yoshgacha bo'lganlar o'rtasida O'zbekiston chempionati","11 - 18 sentabr Buxoro" : "15 yoshgacha bo'lganlar o'rtasida O'zbekiston chempionati","10 - 17 oktabr Xorazim" : "barcha yosh toifasida O'zbekiston chempionati"]
    var keys:[String] = []
    var values:[String] = []
    
    init() {
        for (key, value) in musobaqalar {
            self.keys.append(key)
            self.values.append(value)
        }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            searchView
                .padding(.top)
            control
            listOfData
            Spacer()
        }.navigationTitle("Search")
            
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
extension Search {
    private var searchView: some View {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .shadow(color: .black.opacity(0.2), radius: 3, x: 1, y: 2)
            .frame(width: UIScreen.main.bounds.width - 32, height: 50)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .frame(width: 20, height: 20)
                    TextField(
                            "Search",
                            text: $searchText
                        )
                    
                }.padding(.leading, 20)
                    .padding()
            )
    }
    
    private var control: some View {
        MouthCarusel(categoryNames: ["Do'stlar","Musobaqa","Murabbiy"], childGenderMode: .blue, index: $controlIndex)
    }
    
    private var listOfData: some View {
        VStack {
        switch controlIndex {
        case 0:
        List(1..<15, id: \.self) {index in
            Button(action: {
                
            }) {
                HStack {
                    Image("AvatarBig2")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 45, height: 45)
                    Text("Ismatillo")
                        .foregroundColor(.black)
                }
            }
        }
        case 1:
            List(0..<keys.count, id: \.self) { index in
                
                VStack(alignment: .leading) {
                        Text(keys[index])
                            .foregroundColor(.black)
                            .font(.system(size: 17))
                            .multilineTextAlignment(.leading)
                        Text(values[index])
                            .font(.system(size: 14))
                            .foregroundColor(.black.opacity(0.5))
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                    }.frame( height: 60)
                
            }
        default:
            Text("")
        }
    
        }
    
    }
}
