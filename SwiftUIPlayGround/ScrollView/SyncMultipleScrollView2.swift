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
    @State private var eventScrollViewMinY = CGFloat(0)
    @State private var eventScrollViewMinX = CGFloat(0)

    
    
    var body: some View {
        ZStack(alignment: .top){
            //MARK: 時間軸の背景を描画するScrollView
            ScrollView(.vertical, showsIndicators: false){
                ForEach(0..<24){ i in
                    HStack{
                        Text("\(i):00")
                            .font(.caption)
                        Text("\(eventScrollViewMinY)")
                        Rectangle()
                            .frame(height: 1)
                    }
                    
                    .offset(y: -9)
                    .frame(height: 2*20*1, alignment: .top)
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
                .border(.red, width: 2)
                // 上に乗せた別のScrollViewと動きを同期させる
                .offset(x: 0, y: eventScrollViewOffSet)
                
                
            }
            
            // MARK: 背景に上乗せするScrollView
            ScrollView(.vertical, showsIndicators: false){
                ZStack{
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
                        .foregroundColor(.cyan.opacity(0.3))
                    //TODO: widthに、GeometryReaderから取得したViewの横幅を指定する
                        .frame(width: 200, height: scrollViewContentSize)

                    
                    
                    Rectangle()
                        .frame(width: 140, height: 100)
                        .foregroundColor(.yellow.opacity(0.6))
                        .position(x: 150, y: 50)
                    
                }
            }
            .coordinateSpace(name: "eventScrollView")
        }
    }
}

struct SyncMultipleScrollView2_Previews: PreviewProvider {
    static var previews: some View {
        SyncMultipleScrollView2()
    }
}
