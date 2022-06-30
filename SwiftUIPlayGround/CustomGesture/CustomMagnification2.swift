
//  CustomMagnification2.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/07/01.
//

import SwiftUI

struct CustomMagnification2: View {
    @State private var magnifyBy = 1.0
    @State private var lastMagnificationValue = 1.0
    @State private var debugHeight = 0
    
    var body: some View {
        
        GeometryReader{ proxy in
            ScrollView(.vertical, showsIndicators: false){
                ForEach(0..<25){ i in
                    ZStack(alignment: .top){
                        HStack(){
//                            Text("magnifyBy \(magnifyBy)")
//                            Text("\(((proxy.frame(in: .local).size.height/1440)*60)*CGFloat(magnifyBy))").font(.caption)
                            Text("\(i):00")
                                .font(.caption)
                            Rectangle()
                                .frame(height: 1)
                        }
                        .frame(
//                            // 親Viewのheight / 1440 = 高さ1を1分に見立てる
//                            // 高さ1 × 60 = 60分 = 1時間分
//                            minHeight: ((
//                                (proxy.frame(in: .local).size.height/1440)*60)),
//                            maxHeight: 500,
                            alignment: .top)
                        .offset(y: -6.5)
                    }
                    .frame(height:((proxy.frame(in: .local).height/1440)*60)*CGFloat(magnifyBy)
                           ,alignment: .top)
                    // magnifyByが20の時の高さを限度にする
                    .frame(maxHeight: ((proxy.frame(in: .local).height/1440)*60)*CGFloat(20))
                    .frame(minHeight: ((proxy.frame(in: .local).height/1440)*60))
                    
                }
            }
            .gesture(MagnificationGesture()
                .onChanged{ value in
                    let changeRate = value / lastMagnificationValue
                    if magnifyBy > 20 {
                        magnifyBy = 20
                    }else{
                        magnifyBy *= changeRate
                    }
                    lastMagnificationValue = value
                }
                .onEnded { value in
                    lastMagnificationValue = 1.0
                }
            )
        }

        .border(.blue)
        
        
    }
}

struct CustomMagnification2_Previews: PreviewProvider {
    static var previews: some View {
        CustomMagnification2()
    }
}
