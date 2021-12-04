//
//  SwiftUIView.swift
//  Spotr.uz
//
//  Created by mac on 03/12/21.
//

import SwiftUI

struct MouthCarusel: View {
    let categoryNames: [String]
    let childGenderMode: Color
    @Binding var index: Int
    
    var body: some View {
        VStack {
            HStack (alignment: .center, spacing: 0) {
                  //MARK: - Left Button
                leftButton
                Spacer()
                
                  //MARK: - CustomTabView
                customTapBar
                
                Spacer()
                //MARK: - Right Button
                rightButton
            }
            .frame(height: 60)
            
            Rectangle()
                .fill(childGenderMode)
                .frame(width: UIScreen.main.bounds.width/3, height: 2)
        }
         
    }
}

extension MouthCarusel {
    
    //Custom Tab Bar
    var customTapBar: some View {
        TabsContainer(count: categoryNames.count, index: $index) {
            ForEach((0..<categoryNames.count), id: \.self) { index in
                VStack(spacing: 2) {
                    Text("\(categoryNames[index] )")
                        .foregroundColor(self.index != index ? Color.black.opacity(0.2) : Color.black)
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .padding(.top, 15)
                    
                    Text("Month")
                        .foregroundColor(self.index != index ? Color.black.opacity(0.2) : Color.black)
                        .font(.system(size: 10))
                        .fontWeight(.light)
                        .padding(.bottom, 11)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .onTapGesture {
                    self.index = index
                }
            }
        }
        .padding(.horizontal, 30)
        .frame(width: UIScreen.main.bounds.width-60)
    }
    
    //Right Arrow Button
    var rightButton: some View {
        Button {
            if index != categoryNames.count - 1 {
                index += 1
            }
        } label: {
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .frame(width: 16, height: 24)
                .padding(.trailing,6)
        }
    }
    
    //Left Arrow Button
    var leftButton: some View {
        Button {
            if index != 0 {
                index -= 1
            }
        } label: {
            Image(systemName: "chevron.left")
                .foregroundColor(.gray)
                .frame(width: 16, height: 24)
                .padding(.leading, 6)
        }
    }
}

struct TabsContainer <Content : View> : View {
    let content: Content
    let count : Int
    
    init(count: Int, index: Binding<Int> ,@ViewBuilder content: () -> Content) {
        self.count = count
        self.content = content()
        self._index = index
    }
    
    @GestureState private var translation: CGFloat = 0
    @Binding var index: Int
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                HStack (spacing: 0){
                    self.content
                        .frame(width: geometry.size.width)
                }
                .frame(width: geometry.size.width, alignment: .leading)
                .offset(x: -CGFloat(self.index) * geometry.size.width)
                .animation(.interactiveSpring())
                .gesture(
                    DragGesture()
                        .updating(self.$translation) { gestureValue, gestureState, _ in
                            gestureState = gestureValue.translation.width
                        }
                        .onEnded { value in
                            let offset = value.translation.width / geometry.size.width
                            let newIndex = (CGFloat(self.index) - offset).rounded()
                            self.index = min(max(Int(newIndex), 0), self.count - 1)
                        }
                )
            }
        }
        .padding(.horizontal, UIScreen.main.bounds.width/5)
    }
}
