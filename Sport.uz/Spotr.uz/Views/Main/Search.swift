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
    }
    
}
