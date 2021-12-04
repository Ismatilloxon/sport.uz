//
//  SwiftUIView.swift
//  Spotr.uz
//
//  Created by mac on 03/12/21.
//

import SwiftUI

struct PostCell: View {
    let openData = GetData()
    @State var image: String
    @State var title: String
    @State var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            // Header
            HStack {
                Image("1").resizable()
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading){
                    Text("Sport Vazirligi")
                        .font(Font.system(size: 13.5))
                    Text("Milan, Italy")
                        .font(Font.system(size: 11.5))
                }
                Spacer()
                Image("More")
            }
            
            // Post
            Image(image)
                .resizable()
                .scaledToFit()
                .padding(.leading, -20)
                .padding(.trailing, -20)
            
            // Barre horizontale
            HStack(alignment: .center) {
                Image("Like")
                Image("Comment")
                Image("Send")
                Spacer()
                Image("Collect")
            }
            
            // Le nombre de Likes
            Text(title)
                .font(Font.system(size: 13.5))
            
            // La description
            Text(description)
                            .lineLimit(4)
                            .font(Font.system(size: 12.5))
                            .foregroundColor(.init(white: 0.2))
        }
    }
}
