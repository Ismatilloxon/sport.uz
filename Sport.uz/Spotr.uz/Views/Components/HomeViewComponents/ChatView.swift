//
//  ChatView.swift
//  Spotr.uz
//
//  Created by mac on 03/12/21.
//

import SwiftUI

struct ChatView: View {
    @State var searchText = ""
    let listOfData = [
        UserData(name: "Rustam Mamadaliyev", image: "AvatarBig"),
        UserData(name: "Ismatillo Marufkhonov", image: "myPhoto"),
        UserData(name: "Aliyev Ali", image: "AvatarBig1"),
        UserData(name: "Shaxobiddin Zoirov", image: "AvatarBig2"),
        UserData(name: "Parizoda Kadirxanova", image: "AvatarBig3"),
        UserData(name: "Sherzodxon Kadirxanov", image: "AvatarBig4"),
        UserData(name: "Timur Xasanov", image: "AvatarBig1"),
        
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Divider()
                .padding(.vertical)
            searchView
                .padding(.leading, 20)
            
            rowOfChat
        }
    }
    
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

extension ChatView {
    
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
    
    private var rowOfChat: some View {
        List(0..<listOfData.count, id: \.self) { index in
            
            
            
            Button(action: {
                
            }) {
                HStack {
                    Image(listOfData[index].image)
                        .resizable()
                        .frame(width: 45 ,height: 45, alignment: .leading)
                    
                    VStack(alignment: .leading) {
                        Text(listOfData[index].name)
                            .foregroundColor(.black)
                            .padding(2)
                        Text("Salom")
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                    }
                }
            }
        }
    }
}
struct UserData {
    let name: String
    let image: String
}
