//
//  OnboardingView.swift
//  Spotr.uz
//
//  Created by mac on 03/12/21.
//

import SwiftUI

import SwiftUI

struct OnboardingView: View {
    //MARK: - PROPERTIES
    
    init() {
       UIPageControl.appearance().currentPageIndicatorTintColor = .blue
       UIPageControl.appearance().pageIndicatorTintColor = UIColor.blue.withAlphaComponent(0.2)
       }
    
    @State private var viewIndex = 0
    @State var showHomeView = false
    let width = UIScreen.main.bounds.width
    let presemtScreenContent = [
        "Bu ilova O'zbekiston Respublikasi Sport Vazirligi tavsiyasi bilan ishlab chiqarildi",
        "Bu ilova orqali siz o'z sport darsjangizni bilib oling va professonal sportchilar qatoriga qo'shiling",
        "Sporchi do'stlaringiz bilan aloqada bo'ling va sport yangiliklaridan doimiy habardor bo'ling",
        "O'z haq huquqlaringizni himoya qiling, yillik taqvimdan habardor bo'ling va reyting ballaringizni oshiring",
        "Biz bilan yuksaling va O'zbekiston terma jamoasiga qo'shiling ",
        "Get started",""
    
    ]
    
    
    var body: some View {
        VStack {
            TabView(selection: $viewIndex) {
                ForEach(0..<5) { index in
                    VStack {
                        
                        Text(presemtScreenContent[index])
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .frame(width: width - 100 ,alignment: .center)
                    let imageName = index + 1
                    Image("\(imageName)")
                        .resizable()
                        .frame(width: width, height: 400, alignment: .center)
                    }
                    
                }
            }
            .frame(width: width, height: UIScreen.main.bounds.height / 10 * 6)
                .tabViewStyle(.page(indexDisplayMode: .always))
            Spacer()
            Button(action: {
                withAnimation(.easeInOut) {
                    viewIndex += 1
                    if viewIndex == 5 {
                        showHomeView = true
                    }
                }
                
            }) {
                Text(viewIndex == 4  ? "Get Started" : "Next")
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .foregroundColor(.white)
            }.background(Color.blue)
            
            if showHomeView {
                NavigationLink(destination: SignUp(), isActive: $showHomeView) {}
            }
        }
    }
}

struct OnboardingSingleView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
