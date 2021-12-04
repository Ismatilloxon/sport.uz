//
//  StoriesView.swift
//  Spotr.uz
//
//  Created by mac on 03/12/21.
//

import SwiftUI

struct StoriesView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            // Stories text + Watch all
            HStack {
               Text("Stories")
               Spacer()
               Image("Watch")
               Text("Watch all")
            }
            
            // Stories Circles
            ScrollView([.horizontal], showsIndicators: false){
                HStack {
                    VStack {
                        ZStack(alignment: .bottomTrailing) {
                            Image("AvatarBig")
                            Image("Add")
                        }
                        Text("Your Story")
                            .font(Font.system(size: 13.5))
                    }.padding(.trailing, 12)
                    
                    
                    VStack {
                        ZStack {
                            Image("Border")
                            Image("AvatarBig1")
                        }
                        Text("beardguy")
                            .font(Font.system(size: 13.5))
                    }.padding(.trailing, 12)
                    
                    
                    VStack {
                        ZStack {
                            Image("Border")
                            Image("AvatarBig2")
                        }
                        Text("elleranas")
                            .font(Font.system(size: 13.5))
                    }.padding(.trailing, 12)
                   
                    
                    VStack {
                        ZStack {
                            Image("Border")
                            Image("AvatarBig3")
                        }
                        Text("Ally")
                            .font(Font.system(size: 13.5))
                    }.padding(.trailing, 12)
                    
                    VStack {
                        ZStack {
                            Image("Border")
                            Image("AvatarBig4")
                        }
                        Text("grandpa")
                            .font(Font.system(size: 13.5))
                    }.padding(.trailing, 12)
                    
                    
                    
                }.padding(.leading, 16)
            }.padding(.leading, -20)
             .padding(.trailing, -20)

        }
    }
}
