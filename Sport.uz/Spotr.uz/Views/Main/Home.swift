//
//  Home.swift
//  Spotr.uz
//
//  Created by mac on 03/12/21.
//

import SwiftUI

struct Home: View {
    @State private var showChatView = false
    let openData = GetData()
    @State var image = ""
    let imageArr = ["!","@","#","$","%","^","&","*"]
    @State var count = 0
    
    init() {
        for index in 20...40 {
            openData.allData.remove(at: index)
        }
    }
    
    var body: some View {
            VStack {
            List {
                StoriesView()
                ForEach(0..<openData.allData.count, id: \.self) { index in
                    let data = openData.allData
                    LazyVStack {
                    PostCell(image: image,
                             title: "\(data[index].G2) osiyo chempionatida \(data[index].G11) meadal sohibiga aylandi", description: "Boks musobaqasingnig \(data[index].G8) toifasida sovrindor bo'ldi")
                        .onAppear {
                            
                            image = imageArr[count]
                            if count == 7 {
                                count = 0
                            }
                            count+=1
                        }
                    }
                }
            }
            
                if showChatView {
                    NavigationLink(destination: ChatView(), isActive: $showChatView){}
                }
            }.navigationBarTitle("Sport.uz", displayMode: .inline)
             
             .toolbar(content: {
                 ToolbarItemGroup(placement: .navigationBarTrailing) {
                   
                     Button(action: {
                         withAnimation(.easeInOut) {
                             showChatView = true
                         }
                     }, label: {
                         Image("Direct")
                     })
                 }
             })
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
       Home()
    }
}
