//
//  Shop.swift
//  Spotr.uz
//
//  Created by mac on 03/12/21.
//

import SwiftUI

struct Shop: View {
    @State var searchText = ""
    @State var indexOfStatusControl = 0
    let columns = [GridItem(.flexible(minimum: 10)), GridItem(.flexible(minimum: 10))]
    var statusTitle = ["Kiyim", "Anjom", "Kurs", "Preperat"]
    var satusData = ["sportkiyim","sportanjomlar", "sportkurs","sportkashalar"]
    
    var body: some View {
        VStack {
            searchView
            statusShop
            listOfData
        }
    }
}

struct Shop_Previews: PreviewProvider {
    static var previews: some View {
        Shop()
    }
}

extension Shop {
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
    
    private var statusShop: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                Button(action: {
                    indexOfStatusControl = 0
                }) {
                    Text(statusTitle[0])
                        .foregroundColor(indexOfStatusControl == 0 ? .white : .blue)
                        
                }
                .frame(width: 100, height: 35)
                .background(indexOfStatusControl == 0 ? Color.blue : Color.white)
                .cornerRadius(15)
                .padding(4)
                
                    Button(action: {
                        indexOfStatusControl = 1
                    }) {
                        Text(statusTitle[1])
                            .foregroundColor(indexOfStatusControl == 1 ? .white : .blue)
                            
                    }
                    .frame(width: 100, height: 35)
                    .background(indexOfStatusControl == 1 ? Color.blue : Color.white)
                    .cornerRadius(15)
                    .padding(4)
                    
                    Button(action: {
                        indexOfStatusControl = 2
                    }) {
                        Text(statusTitle[2])
                            .foregroundColor(indexOfStatusControl == 2 ? .white : .blue)
                            
                    }
                    .frame(width: 100, height: 35)
                    .background(indexOfStatusControl == 2 ? Color.blue : Color.white)
                    .cornerRadius(15)
                    .padding(4)
                    
                    Button(action: {
                        indexOfStatusControl = 3
                    }) {
                        Text(statusTitle[3])
                            .foregroundColor(indexOfStatusControl == 3 ? .white : .blue)
                            
                    }
                    .frame(width: 100, height: 35)
                    .background(indexOfStatusControl == 3 ? Color.blue : Color.white)
                    .cornerRadius(15)
                    .padding(4)
                    
            }
            }
        }
        .padding()
    }
    
    private var listOfData: some View {
        ScrollView {
        LazyVGrid(columns: columns, alignment: .center, spacing: 16) {
          
        ForEach(1..<15, id: \.self) {index in
            Button(action: {
                
            }) {
                VStack {
                    Image(satusData[indexOfStatusControl])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 180,height: 150)
                        .cornerRadius(35)
                    Text(statusTitle[indexOfStatusControl])
                        .foregroundColor(.black)
                }
            }
        }
        }
        }
    }
}
