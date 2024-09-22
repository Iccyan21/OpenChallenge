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
                    .padding(.top,60)
                
                // Subtitle
                Text("どっちで挑戦？")
                    .font(.headline)
                    .padding(.top, 10)
                
                // Button stack
                VStack(spacing: 20) {
                    // Free challenge button
                    //                    自由形
                    NavigationLink(destination: FreePostView(challenges: $challenges)) {
                        Rectangle()
                            .frame(width: .infinity,height: 150)
                            .shadow(radius: 10)
                            .foregroundStyle(.blue)
                            .opacity(0.2)
                            .border(.blue, width:2)
                            .overlay{
                                VStack{
                                    HStack {
                                        Text("フリーチャレンジ")
                                            .font(.title)
                                            .bold()
                                            .foregroundStyle(.black)
                                        
                                        Spacer()
                                    }
                                    HStack {
                                        Text("自分でチャレンジを設定できます")
                                            .font(.subheadline)
                                            .foregroundStyle(.black)
                                            .opacity(0.7)
                                        Spacer()
                                    }
                                    HStack {
                                        Text("自分だけのユニークなチャレンジに挑戦したい人に")
                                            .font(.footnote)
                                            .foregroundStyle(.black)
                                            .opacity(0.7)
                                        Spacer()
                                    }
                                }
                                .padding(.leading,15)
                            }
                    }
                    
                    // Random challenge button
                    //                    指定型
                    NavigationLink(destination: RandomChallengeView()) {
                        Rectangle()
                            .frame(width: .infinity,height: 150)
                            .cornerRadius(15)
                            .shadow(radius: 10)
                            .foregroundStyle(.green)
                            .opacity(0.2)
                            .border(.green, width:2)
                            .overlay{
                                VStack{
                                    HStack {
                                        Text("ランダムチャレンジ")
                                            .font(.title)
                                            .bold()
                                            .foregroundStyle(.black)
                                        
                                        Spacer()
                                    }
                                    HStack {
                                        Text("ランダムでチャレンジを設定できます")
                                            .font(.subheadline)
                                            .foregroundStyle(.black)
                                            .opacity(0.7)
                                        Spacer()
                                    }
                                    HStack {
                                        Text("決めるのが苦手な人や、新しい刺激が欲しい人にオススメ！")
                                            .font(.footnote)
                                            .foregroundStyle(.black)
                                            .opacity(0.7)
                                        Spacer()
                                    }
                                }
                                .padding(.leading,15)
                            }
                    }
                    .padding(.top,15)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

// モックデータを用いたプレビュー
struct PostSelectView_Previews: PreviewProvider {
    @State static var challenges = [
        ChallengeModel(id: "1", title: "サンプルチャレンジ1", image: "challenge1", description: "これはサンプルチャレンジです", date: Date(), username: "ユーザー1", userImage: "person1", openMindScore: 90),
        ChallengeModel(id: "2", title: "サンプルチャレンジ2", image: "challenge2", description: "これはサンプルチャレンジです", date: Date(), username: "ユーザー2", userImage: "person2", openMindScore: 80)
    ]
    
    static var previews: some View {
        PostSelectView(challenges: $challenges)
    }
}
