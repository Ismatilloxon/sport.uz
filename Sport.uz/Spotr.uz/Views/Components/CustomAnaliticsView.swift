//
//  CustomAnaliticsView.swift
//  Spotr.uz
//
//  Created by mac on 03/12/21.
//

import SwiftUI

struct CustomAnaliticsView: View {
    
    @State var currentPlot = ""
    @State var offset: CGSize = .zero
    @State var showPlot = false
    @State var translation: CGFloat = 0
    var data: [CGFloat]
    
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                let height = proxy.size.height
                let width = (proxy.size.width) / CGFloat(data.count - 1)
                let maxPoint = (data.max() ?? 0) + 100
                
                let points = data.enumerated().compactMap { item -> CGPoint in
                    let progress = item.element / maxPoint
                    let pathheight = progress * height
                    
                    let pathWidth = width * CGFloat(item.offset)
                    
                    return CGPoint(x: pathWidth, y: -pathheight + height + 20)
               
            }
                ZStack {
                   
                    
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: 0))
                        
                        path.addLines(points)
                    }
                    .strokedPath(StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
                    .fill(
                        LinearGradient(colors: [Color("Gradient1"),Color("Gradient2")], startPoint: .leading, endPoint: .trailing)
                    )
                    fillBGR()
                        .clipShape(
                            Path { path in
                                path.move(to: CGPoint(x: 0, y: 0))
                                
                                path.addLines(points)
                                
                                path.addLine(to: CGPoint(x: proxy.size.width, y: height))
                                
                                path.addLine(to: CGPoint(x: 0, y: height))
                            }
                        )
                    
                }
                .overlay(
                    VStack(spacing: 0) {
                        Text(currentPlot)
                            .font(.caption.bold())
                            .foregroundColor(.white)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 10)
                            .background(Color("Gradient1"))
                            .clipShape(Capsule())
                            .offset(x: translation < 10 ? 30 : 0)
                            .offset(x: translation > (proxy.size.width - 60) ? -30 : 0)
                        Rectangle()
                            .fill(Color("Gradient1"))
                            .frame(width: 1, height: 40)
                            .padding(.top)
                        
                        Circle()
                            .fill(Color("Gradient1"))
                            .frame(width: 22, height: 22)
                            .overlay(
                                Circle()
                                .fill(.white)
                                .frame(width: 10, height: 10)
                                
                            )
                        
                    }
                        .frame(width: 80, height: 170)
                        .offset(y: 40)
                        .offset(offset)
//                        .opacity(showPlot ? 1 : 0)
                    ,alignment: .bottomLeading
                )
                .contentShape(Rectangle())
                .gesture(DragGesture().onChanged({ value in
                    
                    withAnimation { showPlot = true }
                    
                    let translation = value.location.x - 40
                    
                    let index = max(min(Int((translation / width).rounded() + 1), data.count - 1), 0)
                    currentPlot = "\(data[index])"
                    self.translation = translation
                    offset = CGSize(width: points[index].x - 40, height: points[index].y - height)
                    
                    
                }).onEnded({ value in
                    withAnimation { showPlot = false }
                }))
                
            }
            
            .padding(.horizontal, 10)
        }
    }
    
    @ViewBuilder
    func fillBGR() -> some View {
        LinearGradient(colors: [
            Color("Gradient2").opacity(0.3),
            Color("Gradient2").opacity(0.2),
            Color("Gradient2").opacity(0.1)]
                       + Array(repeating: Color("Gradient1").opacity(0.35), count: 14)
                       + Array(repeating: Color.clear, count: 1)
                       , startPoint: .top, endPoint: .bottom)
    }
}

struct CustomAnaliticsView_Previews: PreviewProvider {
    static var previews: some View {
        Progress()
    }
}
