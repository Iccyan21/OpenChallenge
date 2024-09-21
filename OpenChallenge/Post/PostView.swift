//
//  SwiftUIView.swift
//  OpenChallenge
//
//  Created by 水原　樹 on 2024/09/21.
//

import SwiftUI

struct PostView: View {
    let challenge: ChallengeModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Image section
            if let uiImage = UIImage(named: challenge.image) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, minHeight: 200)
                    .clipped()
                    .cornerRadius(12)
                    .shadow(radius: 5)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, minHeight: 200)
                    .foregroundColor(.gray)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .shadow(radius: 5)
            }
            
            // Title
            Text(challenge.title)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            // User information
            HStack(spacing: 8) {
                Image(challenge.userImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                
                Text(challenge.username)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
            }
            
            // Description
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
                    .foregroundColor(.blue)
            }
            
            // Challenge date
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
