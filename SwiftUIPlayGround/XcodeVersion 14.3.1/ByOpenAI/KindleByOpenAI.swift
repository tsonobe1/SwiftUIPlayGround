//
//  KindleByOpenAI.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/12/01.
//

//SwiftUIでKindleを書いてください

import SwiftUI

struct KindleView: View {

    // プロパティ
    @State private var bookTitle: String = ""
    @State private var pageNumber: Int = 0
    @State private var bookmarks: [String] = []

    var body: some View {
        VStack {
            // タイトル
            Text("Kindle")
                .font(.title)
                .padding()
            
            // テキストフィールド
            TextField("Book title", text: $bookTitle)
                .padding()
            
            // スライダー
//            Slider(value: $pageNumber, in: 0...200, step: 1)
//                .padding()

            // ボタン
            Button(action: {
                self.bookmarks.append(self.bookTitle)
            }) {
                Text("Bookmark")
            }
            .padding()

            // リスト
            List {
                ForEach(bookmarks, id: \.self) { bookmark in
                    Text(bookmark)
                }
            }
        }
    }
}

struct KindleView_Previews: PreviewProvider {
    static var previews: some View {
        KindleView()
    }
}
