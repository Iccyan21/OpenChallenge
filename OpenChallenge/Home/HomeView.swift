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
    @Published var isLoading: Bool = false // ローディング状態を管理
    
    private var db = Firestore.firestore()
    
    func fetchChallenges() {
        self.isLoading = true // データ取得開始時にローディングを表示
        db.collection("Challenge").getDocuments { (querySnapshot, error) in
            DispatchQueue.main.async {
                self.isLoading = false // データ取得後にローディングを非表示
            }
            
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                self.challenges = [] // データの重複を避けるためにクリア
                for document in querySnapshot!.documents {
                    let data = document.data()
                    
                    // データのフィールドを手動で抽出
                    let id = document.documentID
                    let title = data["title"] as? String ?? ""
                    let image = data["image"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let timestamp = data["date"] as? Timestamp ?? Timestamp(date: Date())
                    let date = timestamp.dateValue()
                    let username = data["username"] as? String ?? ""
                    let userImage = data["userImage"] as? String ?? ""
                    let openMindScore = data["openMindScore"] as? Int ?? 0
                    
                    // ChallengeModelオブジェクトを作成し、配列に追加
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
            VStack {
                if viewModel.isLoading {
                    ProgressView() // ローディング中にインジケーターを表示
                        .scaleEffect(1.5)
                } else {
                    ScrollView {
                        ForEach(viewModel.challenges) { challenge in
                            PostView(challenge: challenge) // 各チャレンジに対してPostViewを呼び出す
                        }
                    }
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
