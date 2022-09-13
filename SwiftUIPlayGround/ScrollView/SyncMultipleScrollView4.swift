//
//  SyncMultipleScrollView4.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/09/13.
//

import SwiftUI

struct SyncMultipleScrollView4: View {
    @State private var scrollViewContentHeight = CGFloat(800)
    @State private var scrollViewContentWitdh = CGFloat(400)
    @State private var eventScrollViewOffSet = CGFloat(0)
    @State private var eventScrollViewOffSet2 = CGFloat.zero

    @State private var TimelineDividerWidth = CGFloat(0)
    
    @State private var magnifyBy = 1.0
    @State private var lastMagnificationValue = 1.0
    
    @State private var scrollTarget: Int?


    
    var body: some View {
        ZStack(alignment: .top){
            let _ = print("eventScrollViewOffSet: \(eventScrollViewOffSet)")
            
            
            //MARK: 👉 Timeline ScrollView 時間軸の背景を描画する
            ScrollView(.vertical, showsIndicators: false){
                // ScrollViewのコンテンツ同士のスペースを0にするためだけのvStack
                // spacing:0VStackを置かないと、上乗せするScrollViewにコンテンツを配置したときに位置がずれる
                VStack(spacing: 0){
                    ForEach(0..<24){ i in
                        ZStack(alignment: .topLeading){
                            HStack{
                                // MARK: 一桁の数値の先頭に0を付ける
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
                            
                            
                            //MARK: XX:30, XX:15の時間表示
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
//                                .border(.red, width: 2)
                // 別のScrollViewから取得したScrollの度合いを、背景となるScrollViewのoffsetに指定して、ScrollView同士の動きを同期する
                .offset(x: 0, y: eventScrollViewOffSet2)
            }
            .zIndex(1)
            

            //MARK: 👉 Task ScrollView 背景に上乗せするタスクを表示する
//            ScrollViewReader { scrollProxy in
            ScrollView(.vertical, showsIndicators: false){
                ZStack(alignment: .topTrailing){
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
                    // 上乗せするViewのサイズによってスクロールの可動域が変わってしまうため。
                    
                    // TODO: 時間の表示XX:XXを除いた横幅（画面いっぱい）をwidthに指定する
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
                                    // TODO: tapしたrectのstartDataを取得して、scrollViewheight/1440*startDateを取得
                                    // taskBlockHeight = scrollviewHeight / 1_440 * task.startDate
                                    
                                    // TODO: 高さが2*20*magnifyBy/6で144コのrectのうち、taskBlockHeightと合致するのは何番目か？
                                    // q * (2*20*magnifyBy/6) = taskBlockHeight
                                    // banme = taskBlockHeight / (2*20*magnifyBy/6)
                                    // banmeを小数点を切り捨てて、intにする
                                    // scrollTo(banme)
                                    
                                    
                                    // TEST
                                    let taskBlockHeight = scrollViewContentHeight / 1440 * 0
                                    let banme = taskBlockHeight / (2*20*magnifyBy/6)
                                    let intBanme = Int(floor(banme))
                                    print(intBanme)
                                    print("scrollTarget: \(scrollTarget)")
                                    scrollTarget = intBanme
                                    print("scrollTarget: \(scrollTarget)")

                                    
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
                                    // TODO: tapしたrectのstartDataを取得して、scrollViewheight/1440*startDateを取得
                                    // taskBlockHeight = scrollviewHeight / 1_440 * task.startDate
                                    
                                    // TODO: 高さが2*20*magnifyBy/6で144コのrectのうち、taskBlockHeightと合致するのは何番目か？
                                    // q * (2*20*magnifyBy/6) = taskBlockHeight
                                    // banme = taskBlockHeight / (2*20*magnifyBy/6)
                                    // banmeを小数点を切り捨てて、intにする
                                    // scrollTo(banme)
                                    
                                    
                                    // TEST
                                    let taskBlockHeight = scrollViewContentHeight / 1440 * 465
                                    let banme = taskBlockHeight / (2*20*magnifyBy/6)
                                    let intBanme = Int(floor(banme))
                                    print(intBanme)
                                    print("scrollTarget: \(scrollTarget)")
                                    scrollTarget = intBanme
                                    print("scrollTarget: \(scrollTarget)")

                                    
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
                                    // TODO: tapしたrectのstartDataを取得して、scrollViewheight/1440*startDateを取得
                                    // taskBlockHeight = scrollviewHeight / 1_440 * task.startDate
                                    
                                    // TODO: 高さが2*20*magnifyBy/6で144コのrectのうち、taskBlockHeightと合致するのは何番目か？
                                    // q * (2*20*magnifyBy/6) = taskBlockHeight
                                    // banme = taskBlockHeight / (2*20*magnifyBy/6)
                                    // banmeを小数点を切り捨てて、intにする
                                    // scrollTo(banme)
                                    
                                    
                                    // TEST
                                    let taskBlockHeight = scrollViewContentHeight / 1440 * 1170
                                    let banme = taskBlockHeight / (2*20*magnifyBy/6)
                                    let intBanme = Int(floor(banme))
                                    print(intBanme)
                                    print("scrollTarget: \(scrollTarget)")
                                    scrollTarget = intBanme
                                    print("scrollTarget: \(scrollTarget)")

                                    
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
                                    // TODO: tapしたrectのstartDataを取得して、scrollViewheight/1440*startDateを取得
                                    // taskBlockHeight = scrollviewHeight / 1_440 * task.startDate
                                    
                                    // TODO: 高さが2*20*magnifyBy/6で144コのrectのうち、taskBlockHeightと合致するのは何番目か？
                                    // q * (2*20*magnifyBy/6) = taskBlockHeight
                                    // banme = taskBlockHeight / (2*20*magnifyBy/6)
                                    // banmeを小数点を切り捨てて、intにする
                                    // scrollTo(banme)
                                    
                                    
                                    // TEST
                                    let taskBlockHeight = scrollViewContentHeight / 1440 * 600
                                    let banme = taskBlockHeight / (2*20*magnifyBy/6)
                                    let intBanme = Int(floor(banme))
                                    print(intBanme)
                                    print("scrollTarget: \(scrollTarget)")
                                    scrollTarget = intBanme
                                    print("scrollTarget: \(scrollTarget)")

                                    
                                }
                        )
                    }
                .offset(x: 0, y: eventScrollViewOffSet2)
//                .modifier(ifOnlyOffSet(eventScrollViewOffSet2: eventScrollViewOffSet2, isChanged: scrollTarget))
            }
            .coordinateSpace(name: "eventScrollView")
            .zIndex(3)
            .frame(width: 40, alignment: .trailing)
            .background(Color(.red).opacity(0.3))
//            }
            
            
            
            ScrollViewReader { (scrollviewProxy2: ScrollViewProxy) in
                ScrollView {
                    
                    VStack(spacing: 0) {
                        ForEach(0..<144, id: \.self) { obj in
                            ZStack{
//                                Text("\(obj)").font(.caption2)
                            Rectangle()
                                .stroke(.red)
                                .frame(height: 2*20*magnifyBy/6, alignment: .top)
                                .id(obj)
                            }
                        }
                    }
                    
                    .background(
                            GeometryReader { proxy -> Color in
                                DispatchQueue.main.async {
                                    eventScrollViewOffSet2 = proxy.frame(in: .named("scroll")).origin.y
                                    let _ = print("eventScrollViewOffSet2: \(eventScrollViewOffSet2)")

                                }
                                return Color.clear
                            }
                        
                    )
                    
                    .onChange(of: scrollTarget) { target in
                        if let target = target {
                            scrollTarget = nil
                            print("scrollTargetの変更を感知しました, target: \(target)")
                            withAnimation {
                                scrollviewProxy2.scrollTo(target, anchor: .top)
                            }
                        }
                    }
                    

                }
                .coordinateSpace(name: "scroll")

                //                                .frame(width: scrollViewContentWitdh, height: scrollViewContentHeight)
            }
            .zIndex(2)
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

//struct SyncMultipleScrollView4_Previews: PreviewProvider {
//    static var previews: some View {
//        SyncMultipleScrollView4()
//    }
//}
struct ifOnlyOffSet: ViewModifier {
    var eventScrollViewOffSet2: CGFloat
    var isChanged: Int?

    func body(content: Content) -> some View {
        if isChanged != nil {
            let _ = print("nilじゃないです")
//            content
        } else {
            let _ = print("nilです")
            content
                .offset(y: eventScrollViewOffSet2)
        }
    }
}
