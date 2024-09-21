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
                
                Button(action: {
                    let newChallenge = ChallengeModel(title: title, image: image, description: description, date: selectedDate,
                                                      username: username,userImage:userImage,openMindScore: 0)
                  
                }) {
                    Text("チャレンジを作成")
                }
            }
            .navigationTitle("フリーチャレンジ！")
        }
    }
}

//#Preview {
//    FreePostView()
//}
