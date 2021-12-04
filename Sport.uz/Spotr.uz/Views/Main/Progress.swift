//
//  Progress.swift
//  Spotr.uz
//
//  Created by mac on 03/12/21.
//

import SwiftUI

struct Progress: View {
    
    @State var index = 0
    @State var filter: Filter = .byAge
    @State private var mode: Int = 0
    let simplePlot: [CGFloat] = [
        989,1200,750,790,650,950,1200,600,500,600,890,1230,1400,900,1250,1600,1200
    ]
    let bal = [1000,999,995,996,991,800,700,600,500,400,399,389,366,366,355,344,343,333,321,320,311,300]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ScrollView {
                CustomAnaliticsView(data: simplePlot)
                    .frame(height: 250)
                    
            
            Picker("Color", selection: $mode) {
                Text("By age").tag(0)
                Text("By weight").tag(1)
            }.frame(width: 250)
                .pickerStyle(SegmentedPickerStyle())
            if mode == 0{
            MouthCarusel(categoryNames: ["15 yoshgacha","17 yoshgacha","20 yoshgacha","25 yoshgacha","O'zbekiston bo'yicha"], childGenderMode: .blue, index: $index)
                listOfData
            } else {
                MouthCarusel(categoryNames: ["35 kg","45 kg","55 kg","60 kg","O'zbekiston bo'yicha"], childGenderMode: .blue, index: $index)
                listOfData
            }
            }.navigationTitle("Progress")
                .toolbar {
                    ToolbarItem {
                        Text("1200 bal")
                    }
                }
        
            
        }
    }
}

struct Progress_Previews: PreviewProvider {
    static var previews: some View {
        Progress()
    }
}

extension Progress {
    private var listOfData: some View {
        
        ForEach(1..<15, id: \.self) {index in
            Button(action: {
                
            }) {
                HStack {
                    Text("\(index)")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                    Image("AvatarBig2")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                    Text("Ismatillo")
                        .foregroundColor(.black)
                        Spacer()
                    Text("\(bal[index]) bal")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }.frame(width: UIScreen.main.bounds.width - 40)
            }
        }
    }
}

enum Filter {
    case byAge
    case byWeight
}
