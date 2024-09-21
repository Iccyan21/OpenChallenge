//
//  HomeView.swift
//  OpenChallenge
//
//  Created by 水原　樹 on 2024/09/21.
//

import SwiftUI

struct HomeView: View {
    @State private var challenges: [ChallengeModel] = posCallenges // 仮データを使用
    @State private var showCreateChallenge = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(challenges) { challenge in
                    VStack(alignment: .leading, spacing: 16) {
                        // Checking if the UIImage exists
                        if let uiImage = UIImage(named: challenge.image) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: .infinity, minHeight: 200)
                                .clipped()
                                .cornerRadius(12)
                                .shadow(radius: 5)
                        } else {
                            // Fall-back system image if the asset is missing
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity, minHeight: 200)
                                .foregroundColor(.gray)
                                .background(Color(.systemGray6))
                                .cornerRadius(12)
                                .shadow(radius: 5)
                        }
                        
                        Text(challenge.title)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        
                        // ユーザー情報
                        HStack(spacing: 8) {
                            Image(challenge.userImage)
                                .resizable()
                                .scaledToFill() // 画像をフレームにフィットさせる
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                            
                            Text(challenge.username)
                                .font(.title2)
                                .fontWeight(.medium)
                                .foregroundColor(.primary)
                        }
                        
                        Text(challenge.description)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .padding(.top, 4)
                        
                        // OpenMindScore display
                        HStack {
                            Text("Open Mind Score:")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text("\(challenge.openMindScore)")
                                .font(.headline)
                                .foregroundColor(.blue) // Highlight the score
                        }
                        
                        Text("チャレンジ日: \(challenge.date, style: .date)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                }
            }
            .navigationTitle("チャレンジリスト")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showCreateChallenge.toggle()
                    }) {
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .padding()
                    }
                }
            }
            .sheet(isPresented: $showCreateChallenge) {
                PostSelectView()
            }
            .background(Color(.systemGroupedBackground))
        }
    }
}
#Preview {
    HomeView()
}
