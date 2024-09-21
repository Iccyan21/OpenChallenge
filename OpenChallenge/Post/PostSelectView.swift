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
        NavigationView { // Add NavigationView here if not already provided by the parent view
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
                HStack(spacing: 20) {
                    // Free challenge button
                    NavigationLink(destination: FreePostView(challenges: $challenges)) {
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
            .navigationBarHidden(true)
        }
    }
}
