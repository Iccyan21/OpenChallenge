//
//  HomeView.swift
//  OpenChallenge
//
//  Created by 水原　樹 on 2024/09/21.
//

import SwiftUI
import Firebase

class ChallengeViewModel: ObservableObject {
    @Published var challenges: [ChallengeModel] = []
    
    private var db = Firestore.firestore()
    
    func fetchChallenges() {
        db.collection("Challenge").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    
                    // Manually extract each field
                    let id = document.documentID
                    let title = data["title"] as? String ?? ""
                    let image = data["image"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let timestamp = data["date"] as? Timestamp ?? Timestamp(date: Date())
                    let date = timestamp.dateValue()
                    let username = data["username"] as? String ?? ""
                    let userImage = data["userImage"] as? String ?? ""
                    let openMindScore = data["openMindScore"] as? Int ?? 0
                    
                    // Create ChallengeModel object and append it to the array
                    let challenge = ChallengeModel(id: id, title: title, image: image, description: description, date: date, username: username, userImage: userImage, openMindScore: openMindScore)
                    
                    DispatchQueue.main.async {
                        self.challenges.append(challenge)
                    }
                }
            }
        }
    }
}

struct HomeView: View {
    @ObservedObject var viewModel = ChallengeViewModel()
    @State private var showCreateChallenge = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.challenges) { challenge in
                    PostView(challenge: challenge) // Call PostView for each challenge
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
                // Pass challenges to PostSelectView
                PostSelectView(challenges: $viewModel.challenges)
            }
            .background(Color(.systemGroupedBackground))
            .onAppear {
                viewModel.fetchChallenges()
            }
        }
    }
}

#Preview {
    HomeView()
}
