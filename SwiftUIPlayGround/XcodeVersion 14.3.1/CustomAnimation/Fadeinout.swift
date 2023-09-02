//
//  Fadeinout.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/09/15.
//

import SwiftUI

struct Fadeinout: View {
    @State private var FadeInOut = false
    @State private var selectedText: Int?
    
    @State private var title = "Hello World!"
    @Namespace private var animation
    
    enum FadeInOutState {
        case empty
        case first
        case second
    }
    @State private var fadeState = FadeInOutState.empty
    
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView (.horizontal, showsIndicators: true) {
                    HStack {
                        ForEach(0..<20){ i in
                            Text("\(i)")
                                .onTapGesture {
                                    // 👉 1 TAPして
                                    // 選択した文字をpropertyに入れる
                                    // propertyの値が更新されたらfedainを開始して、
                                    // 数秒後にtoolbarにテキストをアニメーションする
                                    selectedText = i
                                    withAnimation(Animation.easeInOut){
                                        fadeState = .first
                                    }
                                    // 😊 3 文字をフェードアウトして
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                        withAnimation(Animation.easeInOut){
                                            fadeState = .second
                                        }
                                    }
                                }
                        }
                    }
                }
            }
            // 😊 2 文字をフェードインして
            if fadeState == .first {
                if let wrappedText = selectedText {
                    Text(String(wrappedText))
                        .font(.title2)
                        .bold()
                        .foregroundColor(.secondary)
//                        .offset(x: 50, y: 50)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                // 🫲 4 文字をタブバーに表示
                if fadeState == .second {
                    VStack {
                        if let wrappedText = selectedText {
                            Text(String(wrappedText))
                                .transition(.slide)
                        }
                    }
                }
            }
        }
    }
}

struct Fadeinout_Previews: PreviewProvider {
    static var previews: some View {
        Fadeinout()
    }
}
