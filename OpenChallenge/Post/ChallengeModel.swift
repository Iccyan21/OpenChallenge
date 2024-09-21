//
//  ChallengePost.swift
//  OpenChallenge
//
//  Created by 水原　樹 on 2024/09/21.
//

import Foundation

// チャレンジモデル
struct ChallengeModel: Identifiable {
    let id = UUID()
    var title: String
    var image: String // 画像URLやシステム名
    var description: String
    var date: Date
    var username: String
    var userImage: String
    var openMindScore: Int // オープンマインドスコア
}

let posCallenges = [
    ChallengeModel(title: "朝5時の公園ランニングチャレンジ",
                   image: "challenge1", // 画像名（システム名やURLを仮定）
                   description: "朝5時に起きて、公園でランニングをして新しい一日をスタートしよう！",
                   date: Date(),
                   username: "本郷純",
                   userImage: "person1",
                   openMindScore: 80),
    
    ChallengeModel(title: "昼食時に即興詩チャレンジ",
                   image: "challenge2", // 画像名（システム名やURLを仮定）
                   description: "カフェでランチを楽しみながら、即興で詩を一編作ってみよう。",
                   date: Date(),
                   username: "さんま",
                   userImage: "person2",
                   openMindScore: 95),
    
    ChallengeModel(title: "深夜ラーメンチャレンジ",
                   image: "challenge1", // 画像名（システム名やURLを仮定）
                   description: "夜中のラーメン屋を訪れて、カウンターで隣の人と友達になろう！",
                   date: Date(),
                   username: "ヤマーダ",
                   userImage: "person3",
                   openMindScore: 70
                  ),
    
    ChallengeModel(title: "路上アートパフォーマンス",
                   image: "challenge3", // 画像名（システム名やURLを仮定）
                   description: "路上で即興アートを披露し、通りすがりの人に作品を渡そう。",
                   date: Date(),
                   username: "加藤愛",
                   userImage: "person4",
                   openMindScore: 100
                  ),
    ChallengeModel(title: "夜のカフェでギター演奏チャレンジ",
                   image: "challenge4", // 画像名（システム名やURLを仮定）
                   description: "カフェでギターを演奏して、周りの人に音楽を共有しよう。",
                   date: Date(),
                   username: "エリザベス",
                   userImage: "person5",
                   openMindScore: 85
                  )
]

