//
//  CustomTabBar.swift
//  Spotr.uz
//
//  Created by mac on 03/12/21.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var indexView: Int
    
    @State var iconsName = ["house.fill", "magnifyingglass.circle.fill", "cart.fill", "", "person.fill"] //"my_Child_active",
    private let tabName = ["Home", "Serch", "Shop", "Progress", "Account"]
    
    var body: some View {
        
        VStack(spacing: 0) {
            HStack(alignment: .firstTextBaseline, spacing: 0) {
                ForEach(0..<iconsName.count, id: \.self) { index in
                    
                    Button(action: {
                        withAnimation {
                            indexView = index
                        }
                    }) {
                        VStack {
                          
                            if index == 3 {
                                Image("progress")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(indexView == index ? .blue : .gray)
                                    .scaledToFit()
                                    .frame(width: 24)
                            }
                            else {
                                Image(systemName: "\(iconsName[index])")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(indexView == index ? .blue : .gray)
                                    .scaledToFit()
                                    .frame(width: 24)
                            }
                            Text(tabName[index])
                                .font(.system(size: 10))
                                .foregroundColor(indexView == index ? .blue : .gray)
                            Spacer()
                        }
                       
                    }
                    .frame(width: UIScreen.main.bounds.width/5)
                    .padding(.top,12)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width , height: 83)
        .background(Color.gray.opacity(0.1))
        
        
        
        
    }
    
    //        .clipShape(CustomCorner(corners: [.topLeft, .topRight], size: 25))
    
}


struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(indexView: .constant(1))
            .previewLayout(.sizeThatFits)
        //            .environmentObject(dev.homeViewVM)
    }
}
