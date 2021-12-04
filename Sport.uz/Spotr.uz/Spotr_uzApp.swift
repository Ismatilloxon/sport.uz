//
//  Spotr_uzApp.swift
//  Spotr.uz
//
//  Created by mac on 03/12/21.
//
import SwiftUI

@main
struct Sport_uzApp: App {
    let getData = GetData()
    var body: some Scene {
        WindowGroup {
            NavigationView {
//                ContentView()
                OnboardingView()
//                SignUp()
                    .onAppear {
                        print(getData.allData.count)
                    }
            }
        }
    }
}
