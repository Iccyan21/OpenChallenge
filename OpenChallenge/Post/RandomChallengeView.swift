//
//  RandomChallengeView.swift
//  OpenChallenge
//
//  Created by 水原　樹 on 2024/09/21.
//

import SwiftUI

struct RandomChallengeView: View {
    // Sample challenge data
    let challenges = [
        "友達に料理を振る舞う",
        "困っている人を助ける",
        "朝6時に公園でランニング",
        "会社・学校で、バレないようにモノマネをする",
        "友人に花束を渡す"
    ]
    
    // State to store the selected challenge
    @State private var selectedChallenge: String = "スタートボタンを押して、お題を決めましょう"
    @State private var isStarted: Bool = false
    
    var body: some View {
        VStack(spacing: 40) {
            // Title
            Text("本日のお題は…")
                .font(.title2)
                .fontWeight(.medium)
                .padding(.top, 50)
            
            // Randomly selected challenge text
            Text(selectedChallenge)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // Result confirmation
            if selectedChallenge != "スタートボタンを押して、お題を決めましょう" {
                Text("に決定！")
                    .font(.title3)
                    .fontWeight(.medium)
                    .padding(.top, 10)
            }
            
            Spacer()
            
            // "Start" Button to randomize the challenge
            if isStarted == false{
                Button(action: {
                    selectedChallenge = challenges.randomElement() ?? "お題がありません"
                    isStarted.toggle()
                }) {
                    Text("スタート")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                }
            }
            
            // "Next" Button to proceed (only visible if a challenge has been selected)
            if selectedChallenge != "スタートボタンを押して、お題を決めましょう" {
                NavigationLink(destination: HomeView()) {
                    Text("さあチャレンジ！")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

// Dummy NextView for the "Next" button
struct NextView: View {
    var body: some View {
        Text("次の画面へ")
            .font(.title)
    }
}

#Preview {
    RandomChallengeView()
}
