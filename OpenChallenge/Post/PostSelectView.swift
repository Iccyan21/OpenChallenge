//
//  PostSelectView.swift
//  OpenChallenge
//
//  Created by 水原　樹 on 2024/09/21.
//

import SwiftUI

struct PostSelectView: View {
    @Binding var challenges: [ChallengeModel]
    var body: some View {
        VStack(spacing: 40) {
            // Main title
            Text("オープンマインドチャレンジ！")
                .font(.title)
                .fontWeight(.bold)
            
            // Subtitle
            Text("どっちで挑戦？")
                .font(.headline)
                .padding(.top, 10)
            
            // Button stack
            // Button stack
            HStack(spacing: 20) {
                // Free challenge button
                NavigationLink(destination:  FreePostView(challenges: $challenges)) {
                    Text("自由型")
                        .font(.headline)
                        .frame(width: 120, height: 80)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .foregroundColor(.black)
                }
                
                // Random challenge button
                NavigationLink(destination: RandomChallengeView()) {
                    Text("指定型")
                        .font(.headline)
                        .frame(width: 120, height: 80)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .foregroundColor(.black)
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("")
        .navigationBarHidden(true) // Hide the navigation bar to match your design
    }
}



struct TestOptionView: View {
    var iconName: String
    var label: String
    
    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
            
            Text(label)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
        }
        .frame(width: 120, height: 120)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.7), Color.red.opacity(0.7)]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
        )
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}
