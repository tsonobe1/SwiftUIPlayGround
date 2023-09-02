
import SwiftUI


struct SyncMultipleScrollView3: View {
    @State private var scrollViewContentHeight: CGFloat = CGFloat(0)
    @State private var TimelineDividerWidth: CGFloat = CGFloat(0)
    
    @State private var magnifyBy: Double = 1.0
    @State private var lastMagnificationValue: Double = 1.0
    
    
    var body: some View {
        ZStack(alignment: .top){
            // MARK: 背景の時間軸を表示するScrollView
            ScrollView(.vertical, showsIndicators: false){
                // ScrollViewのコンテンツ同士のスペースを0にするためだけのvStack
                // spacing:0のVStackを置かないと、overrideするコンテンツの位置がずれる
                VStack(spacing: 0){
                    ForEach(0..<24){ i in
                        ZStack(alignment: .topLeading){
                            // XX:XXとDivider
                            HStack{
                                // 一桁の数値の先頭に0を付ける
                                Text("\(String(format: "%02d", i)):00")
                                    .font(.caption)
                                    .opacity(0.6)
                                
                                // Divider
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.secondary.opacity(0.7))
                                // Eventのブロックの横幅とdividerの長さを一致させるために必要
                                    .background(GeometryReader{ proxy -> Color in
                                        DispatchQueue.main.async {
                                            TimelineDividerWidth = proxy.size.width
                                        }
                                        return Color.clear
                                    }
                                    )
                            }
                            // ズレ修正
                            .offset(y: -7)
                            // 1h分の列幅
                            .frame(height: 2*20*magnifyBy, alignment: .top)
                            .frame(minHeight: 40, maxHeight: 1200)
                            
                            // 拡大率に応じてXX:30, XX:15, XX:45の表示を追加
                            switch magnifyBy {
                            case 2...4:
                                ColonDelimitedTimeDivider(hour: i, time: 30, parentScrollViewHeight: scrollViewContentHeight)
                            case 4...35:
                                ColonDelimitedTimeDivider(hour: i, time: 30, parentScrollViewHeight: scrollViewContentHeight)
                                ColonDelimitedTimeDivider(hour: i, time: 15, parentScrollViewHeight: scrollViewContentHeight)
                                ColonDelimitedTimeDivider(hour: i, time: 45, parentScrollViewHeight: scrollViewContentHeight)
                            default:
                                EmptyView()
                            }
                        }
                    }
                }
                // MARK: ScrollViewの高さ取得と上乗せするコンテンツ
                .overlay(
                    ZStack(alignment: .topTrailing){
                        // ScrollViewの(コンテンツを含めた)高さをGeometryReaderで取得
                        // この高さを1440(24h)で割って標準化した値を使うことで、
                        // EventやXX:15などの時間表示を、ScrollViewの上に配置しやすくする
                        GeometryReader{ proxy -> Color in
                            DispatchQueue.main.async {
                                scrollViewContentHeight = proxy.frame(in: .global).size.height
                            }
                            return Color.clear
                        }
                        
                        // Eventの配置
                        // Coredataからfetchしたdataをforで回して配置していく
                        // 以下サンプル
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: TimelineDividerWidth, height: scrollViewContentHeight/1440*60)
                            .foregroundColor(.yellow.opacity(0.6))
                            .overlay(Text("0:00~1:00 \(magnifyBy)"))
                            .offset(y: 0)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: TimelineDividerWidth, height: (scrollViewContentHeight/1440*120))
                            .foregroundColor(.blue.opacity(0.6))
                            .overlay(Text("7:45~9:45"))
                            .offset(y: (scrollViewContentHeight/1440*465))
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: TimelineDividerWidth, height: (scrollViewContentHeight/1440*120))
                            .foregroundColor(.green.opacity(0.6))
                            .overlay(Text("19:30~21:30"))
                            .offset(y: (scrollViewContentHeight/1440*1170))
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: TimelineDividerWidth, height: (scrollViewContentHeight/1440*180))
                            .foregroundColor(.gray.opacity(0.6))
                            .overlay(Text("XX:XX~XX:XX"))
                            .offset(y: (scrollViewContentHeight/1440*600))
                    }
                )
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

// Colon-delimited time display
private struct ColonDelimitedTimeDivider: View {
    var hour: Int
    var time: Int
    var parentScrollViewHeight: CGFloat
    
    var body: some View{
        HStack{
            Text("\(String(format: "%02d", hour)):\(time)")
                .font(.caption)
                .opacity(0.6)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.secondary.opacity(0.5))
        }
        .offset(y: -7+(parentScrollViewHeight/1440*CGFloat(time)))
        .transition(.opacity)
    }
}

struct SyncMultipleScrollView3_Previews: PreviewProvider {
    static var previews: some View {
        SyncMultipleScrollView3()
            .preferredColorScheme(.dark)
    }
}
