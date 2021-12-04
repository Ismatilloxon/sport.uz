//
//  ContentView.swift
//  Spotr.uz
//
//  Created by mac on 03/12/21.
//

import SwiftUI

struct ContentView: View {
    @State var indexView = 0
    
    var body: some View {
        VStack(spacing:0) {
            ZStack {
                switch indexView {
                case 0 :
                    Home()
                case 1:
                    Search()
                case 2:
                    Shop()
                case 3 :
                    Progress()
                case 4:
                    Account()
                default:
                    EmptyView()
                    Spacer()
                }
            }
            
            
            //MARK: - TopBar
            CustomTabBar(indexView: $indexView)
            
        }
        .edgesIgnoringSafeArea([.bottom])
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
