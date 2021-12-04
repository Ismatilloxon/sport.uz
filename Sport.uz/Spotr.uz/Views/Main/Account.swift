//
//  Account.swift
//  Spotr.uz
//
//  Created by mac on 03/12/21.
//

import SwiftUI

struct Account: View {
    let columns = [GridItem(.flexible(minimum: 10)), GridItem(.flexible(minimum: 10)), GridItem(.flexible(minimum: 10))]
    var statusTitle = ["Kiyim", "Anjom", "Kurs", "Preperat"]
    var satusData = ["sportkiyim","sportanjomlar", "sportkurs","sportkashalar"]
    let otherInfo = ["Diplomlar", "Sportchi Malumotnomasi","Darajam", "Yutuqlar", "Yuridik Yordam", "Halqaro Hamkorlik"]
    
    
    @State var index = 0
    @State private var state: Int = 0
    
    var body: some View {
        VStack {
            Picker("Color",selection: $state) {
                Text("main").tag(0)
                Text("Other").tag(1)
            }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: UIScreen.main.bounds.width - 100)
            if state == 0 {
            aboutUser
            } else {
                userInfoOthser
            }
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                navigationBarTitle
            }
        }
    }
}

struct Account_Previews: PreviewProvider {
    static var previews: some View {
        Account()
    }
}

extension Account {
    // MARK: NAVIGATION BAR TITLE
    private var navigationBarTitle: some View {
        HStack {
            Text("Marufkhonov_Ismatillo")
                .font(.system(size: 17))
            Image(systemName: "chevron.down")
                .resizable()
                .frame(width: 10, height: 5)
                .padding(.top, 5)
            Spacer()
            Button(action: {
                // Give Me some action☹️
            }) {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 20, height: 20)
              
            }
            Button(action: {
                
            }) {
                Image(systemName: "text.justify")
                    .resizable()
                    .frame(width: 20, height: 20)
                   
            }
        }.frame(width: UIScreen.main.bounds.width - 32)
    }
    
    // MARK: MAIN VIEW
    
    private var aboutUser: some View {
        VStack(alignment: .leading) {
            // image
            HStack {
            Spacer()
            Image("myPhoto")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
            Spacer()
            VStack {
                Text("30")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                
                Text("Rasm")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
            }
            
            Spacer()

            VStack {
                Text("136")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                
                Text("Padpischik")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack {
                Text("30")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                
                Text("Podpiska")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
            }
            
            Spacer()

        }
        // description
            HStack {
                VStack(alignment: .leading) {
                    Text("Ismatillo")
                        
                    Text("Student of TUIT")
                        .foregroundColor(Color.gray)
                    
                    Text("iOS developer")
                        .foregroundColor(Color.gray)
                    Text("Player of table tennis")
                        .foregroundColor(Color.gray)
                    
                    
                    
                }.padding(16)
            }
            // buttons
            HStack {
                Button(action: {
                    index = 0
                }) {
                    VStack {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.black)
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width / 3 - 10, height: 1)
                            .foregroundColor(index == 0 ? .black : .white)
                    }
                }.frame(width: UIScreen.main.bounds.width / 3)
                
                Button(action: {
                    index = 1
                }) {
                    VStack {
                    Image(systemName: "video")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.black)
                        
                    
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width / 3 - 10, height: 1)
                        .foregroundColor(index == 1 ? .black : .white)
                    }
                }.frame(width: UIScreen.main.bounds.width / 3)
                
                Button(action: {
                    index = 2
                }) {
                    VStack {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.black)
                    
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width / 3 - 10, height: 1)
                        .foregroundColor(index == 2 ? .black : .white)
                    }
                }.frame(width: UIScreen.main.bounds.width / 3)
                
                
                
            }.padding(.top)
            ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(1..<10, id:\.self) {index in
                    Image("myPhoto")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
            }
            }
        }
        
    }
    
    private var userInfoOthser: some View {
        List(otherInfo, id: \.self) {item in
            Button(action: {
                
            }) {
                Text(item)
                    .foregroundColor(.black)
            }
        }
    }
}
