//
//  FreePostView.swift
//  OpenChallenge
//
//  Created by 水原　樹 on 2024/09/21.
//

import SwiftUI

struct FreePostView: View {
    @State private var title: String = ""
    @State private var username: String = ""
    @State private var userImage: String = ""
    @State private var image: String = "" // 画像URLまたはシステム画像名
    @State private var description: String = ""
    @State private var selectedDate: Date = Date()
    @Binding var challenges: [ChallengeModel]
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("チャレンジタイトル")) {
                        TextField("タイトルを入力", text: $title)
                    }
                    Section(header: Text("画像URLまたは名前")) {
                        TextField("画像を入力", text: $image)
                    }
                    Section(header: Text("チャレンジの説明")) {
                        TextField("説明を入力", text: $description)
                    }
                    Section(header: Text("チャレンジの日付")) {
                        DatePicker("日付を選択", selection: $selectedDate, displayedComponents: .date)
                    }
                }
                NavigationLink(destination:HomeView()){
                    Button(action: {
                        // ChallengeModel の正しい引数順序に合わせて初期化
                        let newChallenge = ChallengeModel(
                            id: UUID().uuidString,   // IDを自動生成
                            title: title,            // チャレンジのタイトル
                            image: image,            // 画像URL
                            description: description, // 説明
                            date: selectedDate,      // 日付
                            username: username,      // ユーザー名
                            userImage: userImage,    // ユーザー画像
                            openMindScore: 50        // 仮のスコア
                        )
                        challenges.append(newChallenge) // リストに追加
                    }) {
                        Text("チャレンジを作成")
                            .foregroundColor(.white) // テキストの色を白に
                            .padding()               // 余白を追加
                            .frame(maxWidth: .infinity) // ボタン幅を画面幅いっぱいに
                            .background(Color.blue)  // 背景色を青に
                            .cornerRadius(10)        // ボタンを角丸に
                            .padding() // 外側に余白を追加してボタンが端にくっつかないようにする
                    }
                }
            }
            .navigationTitle("フリーチャレンジ！")
        }
    }
}

#Preview {
    // プレビュー用のダミーデータを定義
    FreePostView(challenges: .constant([
        ChallengeModel(id: "1", title: "Sample", image: "sample.jpg", description: "Sample description", date: Date(), username: "user", userImage: "user.jpg", openMindScore: 50)
    ]))
}
