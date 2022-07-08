//
//  SyncMultipleScrollView2.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/07/05.
//

import SwiftUI

struct SyncMultipleScrollView2: View {
    @State private var scrollViewContentSize = CGFloat(800)
    @State private var eventScrollViewOffSet = CGFloat(0)
    @State private var eventScrollViewMinX = CGFloat(0)
    
    @State private var magnifyBy = 1.0
    @State private var lastMagnificationValue = 1.0
    
    
    var body: some View {
        ZStack(alignment: .top){
            //MARK: 時間軸の背景を描画するScrollView
            ScrollView(.vertical, showsIndicators: false){
                // ScrollViewのコンテンツ同士のスペースを0にするためだけのvStack
                // spacing:0VStackを置かないと、上乗せするScrollViewにコンテンツを配置したときに位置が少しずれる
                VStack(spacing: 0){
                    
                    ForEach(0..<24){ i in
                        HStack{
                            // MARK: 一桁の数値の先頭に0を付ける
                            Text("\(String(format: "%02d", i)):00")
                                .font(.caption)
                                .opacity(0.6)
                            //                        Text("\(scrollViewContentSize/24)")
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.secondary.opacity(0.7))
                        }
                        .offset(y: -7)
                        .frame(height: 2*20*magnifyBy, alignment: .top)
                        .frame(minHeight: 40, maxHeight: 1200)
                    }
                    
                    
                }
                // ScrollViewの全コンテンツ分の高さを取得
                // 別のScrollViewを上に乗せてサイズを一致させるため
                .overlay(
                    GeometryReader{ proxy -> Color in
                        DispatchQueue.main.async {
                            scrollViewContentSize = proxy.frame(in: .global).size.height
                        }
                        return Color.clear
                    }
                )
                //                .border(.red, width: 2)
                // 上に乗せた別のScrollViewと動きを同期させる
                .offset(x: 0, y: eventScrollViewOffSet)
            }
            
            // MARK: 背景に上乗せするScrollView
            ScrollView(.vertical, showsIndicators: false){
                ZStack(alignment: .top){
                    Rectangle()
                        .background(
                            ZStack(alignment: .top){
                                GeometryReader { geo -> Color in
                                    DispatchQueue.main.async {
                                        // Scroll度合いを取得して背景のScrollViewに提供することで、動きを同期させる
                                        eventScrollViewOffSet = geo.frame(in: .named("eventScrollView")).minY
                                    }
                                    return Color.clear
                                }
                            }
                        )
                        .foregroundColor(.clear.opacity(0.3))
                    
                    // MARK: 背景ScrollViewのheightを前景ScrollViewに指定する
                    // これにより、見切れている部分までスクロールできるようにする
                    // 上乗せするViewのサイズによってスクロールの可動域が変わってしまうため。
                    
                    // TODO: widthに、時間表示を覗いた横幅（画面いっぱい）を指定する
                        .frame(width: 200, height: scrollViewContentSize)
                    
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 300, height: scrollViewContentSize/1440*60)
                        .foregroundColor(.yellow.opacity(0.6))
                        .overlay(Text("0:00~1:00 \(magnifyBy)"))
                        .offset(y: 0)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 300, height: (scrollViewContentSize/1440*120))
                        .foregroundColor(.blue.opacity(0.6))
                        .overlay(Text("7:45~9:45"))
                        .offset(y: (scrollViewContentSize/1440*465))
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 300, height: (scrollViewContentSize/1440*120))
                        .foregroundColor(.green.opacity(0.6))
                        .overlay(Text("19:30~21:30"))
                        .offset(y: (scrollViewContentSize/1440*1170))
                    
                }
            }
            .coordinateSpace(name: "eventScrollView")
        }
        .gesture(MagnificationGesture()
            .onChanged{ value in
                let changeRate = value / lastMagnificationValue
                if magnifyBy > 30 {
                    magnifyBy = 30
                }else if magnifyBy < 1 {
                    magnifyBy = 1
                }else {
                    magnifyBy *= changeRate
                }
                lastMagnificationValue = value
            }
            .onEnded { value in
                lastMagnificationValue = 1.0
            }
        )
    }
}

struct SyncMultipleScrollView2_Previews: PreviewProvider {
    static var previews: some View {
        SyncMultipleScrollView2()
            .preferredColorScheme(.dark)
    }
}
