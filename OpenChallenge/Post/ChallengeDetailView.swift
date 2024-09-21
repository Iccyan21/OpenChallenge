//
//  ChallengeDetailView.swift
//  OpenChallenge
//
//  Created by 水原　樹 on 2024/09/21.
//

import SwiftUI

struct ChallengeDetailView: View {
    var challenge: ChallengeModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if let uiImage = UIImage(named: challenge.image) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.gray)
            }
            
            Text(challenge.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(challenge.description)
                .font(.body)
                .padding(.top, 4)
            
            Text("チャレンジ日: \(challenge.date, style: .date)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding()
        .navigationTitle(challenge.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
