//
//  SyncMultipleScrollView4.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/09/13.
//

import SwiftUI

//MARK: Timeline上に配置したContentのブロックをタップすると、そのContentまでスクロールするView
/*
 構造
 -> Rectangleを縦に複数配置したView
   -> override: timelineView
     -> override: ContentBlock

 方法：ざっくり
 - Rectangleを縦に複数配置したScrollView(A)を作り、その上に(overrideで)00:00~23:59のTimelineを表すView(B)を表示する
 - BはHStackで囲んだText(00:00)とRectangle(divider)をforで24回繰り返す -> 00:00から23:00を表示する
 - BのHStackは"40*magnifyBy(拡大率)"にする。 -> 1時間あたりの幅になる
 - BはScrollViewの中身の高さが"24*(40*magnifyBy)"になる -> 最低でも960

 - AはRectをたくさん配置すればするほど、toScrollで移動するときの精度が高まる。今回は144コにする
 - Aは、ScrollViewの中身の高さが、Bと同じになるように、各rectの高さを設定する -> [A:144*(40*magnifyBy/6)] = [B:24*(40*magnifyBy)]
 - Aの各Rectに.id modifireでidを付与する
 
 - Bの上に(overrideで)、Taskを配置するViewを作成する
 - BはZStackで、各タスクを配置する
 - ScrollVIewの中身の高さを1440分割することで、ScrollViewの高さが変わっても、常に1分分の高さを割り出せる
 - Taskの開始時刻を分単位にして、"ScrollViewの中身の高さ/1440*Taskの開始時刻(分単位)"をoffset(y:)に指定することで、Taskを配置する
 
 - Taskをタップしたときに、"ScrollViewの中身の高さ/1440*Taskの開始時刻(分単位)"を[A:144*(40*magnifyBy/6)]で割った値を使い、タスクのTopが、Aの何番目のRectと同じ位置にあるかを調べる
 - Taskをタップしたときに、Aの何番目のRectかをInt値で@Stateに入れる
 - @Stateが変化したときに、Aの.onChange modifireが発火するようにしておく
 - その.onChangeの中で、toScroll(Int)とし、強制的にTaskのブロックまでスクロールさせる

*/
struct SyncMultipleScrollView5: View {
    @State private var scrollViewContentHeight = CGFloat(800)
    @State private var scrollViewContentWitdh = CGFloat(400)
    
    @State private var TimelineDividerWidth = CGFloat(0)
    
    @State private var magnifyBy = 1.0
    @State private var lastMagnificationValue = 1.0
    
    @State private var scrollTarget: Int?
        
    
    var body: some View {
        ZStack(alignment: .top){
            //MARK: toScrollの移動先を設けるためのView
            ScrollViewReader { (scrollviewProxy2: ScrollViewProxy) in
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(0..<144, id: \.self) { obj in
                            ZStack{
                                Rectangle()
                                    .stroke(.red)
                                    .frame(height: 2*20*magnifyBy/6, alignment: .top)
                                    .id(obj)
                            }
                        }
                    }
                    .onChange(of: scrollTarget) { target in
                        if let target = target {
                            scrollTarget = nil
                            print("scrollTargetの変更を感知しました, target: \(target)")
                            withAnimation {
                                scrollviewProxy2.scrollTo(target, anchor: .top)
                            }
                        }
                    }
                    //MARK: 背景のtimelineView
                    .overlay(
                        VStack(spacing: 0){
                            ForEach(0..<24){ i in
                                ZStack(alignment: .topLeading){
                                    HStack{
                                        Text("\(String(format: "%02d", i)):00")
                                            .font(.caption)
                                            .opacity(0.6)
                                        
                                        Rectangle()
                                            .frame(height: 1)
                                            .foregroundColor(.secondary.opacity(0.7))
                                            .background(GeometryReader{ proxy -> Color in
                                                DispatchQueue.main.async {
                                                    TimelineDividerWidth = proxy.size.width
                                                }
                                                return Color.clear
                                            })
                                    }
                                    .offset(y: -7)
                                    // 1h分の列幅
                                    .frame(height: 2*20*magnifyBy, alignment: .top)
                                    .frame(minHeight: 40, maxHeight: 1200)
                                    switch magnifyBy {
                                    case 2...4:
                                        HStack{
                                            Text("\(String(format: "%02d", i)):30")
                                                .font(.caption)
                                                .opacity(0.6)
                                            Rectangle()
                                                .frame(height: 1)
                                                .foregroundColor(.secondary.opacity(0.5))
                                        }
                                        .offset(y: -7+(scrollViewContentHeight/1440*CGFloat(30)))
                                        .transition(.opacity)
                                        
                                    case 4...35:
                                        HStack{
                                            Text("\(String(format: "%02d", i)):30")
                                                .font(.caption)
                                                .opacity(0.6)
                                            Rectangle()
                                                .frame(height: 1)
                                                .foregroundColor(.secondary.opacity(0.5))
                                        }
                                        .offset(y: -7+(scrollViewContentHeight/1440*CGFloat(30)))
                                        HStack{
                                            Text("\(String(format: "%02d", i)):15")
                                                .font(.caption)
                                                .opacity(0.6)
                                            Rectangle()
                                                .frame(height: 1)
                                                .foregroundColor(.secondary.opacity(0.5))
                                        }
                                        .offset(y: -7+(scrollViewContentHeight/1440*CGFloat(15)))
                                        
                                        HStack{
                                            Text("\(String(format: "%02d", i)):45")
                                                .font(.caption)
                                                .opacity(0.6)
                                            Rectangle()
                                                .frame(height: 1)
                                                .foregroundColor(.secondary
                                                    .opacity(0.5))
                                        }
                                        .offset(y: -7+(scrollViewContentHeight/1440*CGFloat(45)))
                                    default:
                                        EmptyView()
                                    }
                                    
                                }
                            }
                            
                        }
                        // ScrollViewの中の全コンテンツを合わせた高さを取得
                        // 別のScrollViewを上に乗せて、サイズを一致させるために必要
                            .overlay(
                                GeometryReader{ proxy -> Color in
                                    DispatchQueue.main.async {
                                        scrollViewContentHeight = proxy.frame(in: .global).size.height
                                        scrollViewContentWitdh = proxy.size.width - 5
                                    }
                                    return Color.clear
                                }
                            )
                        //MARK: Taskのコンテンツ用view
                            .overlay(
                                ZStack(alignment: .topTrailing){
                                    Rectangle()
                                        .foregroundColor(.clear.opacity(0.3))
                                        .frame(width: scrollViewContentWitdh, height: scrollViewContentHeight)
                                    
                                    // TaskをForEachで回して表示する
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: TimelineDividerWidth, height: scrollViewContentHeight/1440*60)
                                        .foregroundColor(.yellow.opacity(0.6))
                                        .overlay(Text("0:00~1:00 \(magnifyBy)"))
                                        .offset(y: 0)
                                        .gesture(
                                            TapGesture()
                                                .onEnded{
                                                    // MARK: tapしたrectのstartDataを取得して、scrollViewheight/1440*startDateを取得
                                                    // taskBlockHeight = scrollviewHeight / 1_440 * task.startDate
                                                    
                                                    // MARK: 高さが2*20*magnifyBy/6で144コのrectのうち、taskBlockHeightと合致するのは何番目か？
                                                    // q * (2*20*magnifyBy/6) = taskBlockHeight
                                                    // banme = taskBlockHeight / (2*20*magnifyBy/6)
                                                    // banmeを小数点を切り捨てて、intにする
                                                    // scrollTo(banme)
                                                    
                                                    // TEST
                                                    let taskBlockHeight = scrollViewContentHeight / 1440 * 0
                                                    let banme = taskBlockHeight / (2*20*magnifyBy/6)
                                                    let intBanme = Int(floor(banme))
                                                    scrollTarget = intBanme
                                                }
                                        )
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: TimelineDividerWidth, height: (scrollViewContentHeight/1440*120))
                                        .foregroundColor(.blue.opacity(0.6))
                                        .overlay(Text("7:45~9:45"))
                                        .offset(y: (scrollViewContentHeight/1440*465))
                                        .gesture(
                                            TapGesture()
                                                .onEnded{
                                                    let taskBlockHeight = scrollViewContentHeight / 1440 * 465
                                                    let banme = taskBlockHeight / (2*20*magnifyBy/6)
                                                    let intBanme = Int(floor(banme))
                                                    scrollTarget = intBanme
                                                }
                                        )
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: TimelineDividerWidth, height: (scrollViewContentHeight/1440*120))
                                        .foregroundColor(.green.opacity(0.6))
                                        .overlay(Text("19:30~21:30"))
                                        .offset(y: (scrollViewContentHeight/1440*1170))
                                        .gesture(
                                            TapGesture()
                                                .onEnded{
                                                    let taskBlockHeight = scrollViewContentHeight / 1440 * 1170
                                                    let banme = taskBlockHeight / (2*20*magnifyBy/6)
                                                    let intBanme = Int(floor(banme))
                                                    scrollTarget = intBanme
                                                }
                                        )
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: TimelineDividerWidth, height: (scrollViewContentHeight/1440*180))
                                        .foregroundColor(.gray.opacity(0.6))
                                        .overlay(Text("XX:XX~XX:XX"))
                                        .offset(y: (scrollViewContentHeight/1440*600))
                                        .gesture(
                                            TapGesture()
                                                .onEnded{
                                                    let taskBlockHeight = scrollViewContentHeight / 1440 * 600
                                                    let banme = taskBlockHeight / (2*20*magnifyBy/6)
                                                    let intBanme = Int(floor(banme))
                                                    scrollTarget = intBanme
                                                }
                                        )
                                }
                            )
                    )
                }
                .coordinateSpace(name: "scroll")
            }
        }
        //MARK: magnificationGestureの拡大率を利用してScrollViewをピンチイン・アウトする
        .gesture(MagnificationGesture()
            .onChanged{ value in
                let maxScale: CGFloat = 30.0
                let minScale: CGFloat = 1.0
                
                let changeRate = value / lastMagnificationValue
                if magnifyBy > maxScale {
                    magnifyBy = maxScale
                }else if magnifyBy < minScale {
                    magnifyBy = minScale
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
