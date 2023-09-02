
//  CustomMagnification2.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/07/01.
//

import SwiftUI

struct CustomMagnification2: View {
    @State private var magnifyBy = 1.0
    @State private var lastMagnificationValue = 1.0
    @State private var ScrollViewAllSize: CGFloat = 800
    
    var body: some View {
        ZStack{
            ScrollView(.vertical, showsIndicators: false){
                ForEach(0..<25){ i in
                    ZStack(alignment: .top){
                        HStack{
                            Text("\(i):00")
                                .font(.caption)
                            Text("\(ScrollViewAllSize)")
                                .font(.caption)
                            Rectangle()
                                .frame(height: 1)
                        }
                        //                        .offset(y: -6.5)
                    }
                    .frame(height: 2*20*magnifyBy, alignment: .top)
                }
            }
            .gesture(MagnificationGesture()
                .onChanged{ value in
                    let changeRate = value / lastMagnificationValue
                    if magnifyBy > 40 {
                        magnifyBy = 40
                    }else{
                        magnifyBy *= changeRate
                    }
                    lastMagnificationValue = value
                }
                .onEnded { value in
                    lastMagnificationValue = 1.0
                }
            )
//            .overlay(
//                GeometryReader{ proxy in
//                    Text("TEST").position(y: proxy.size.height/1440*465)
//                    RoundedRectangle(cornerRadius: 20)
//                        .opacity(0.4)
//                        .foregroundColor(.cyan)
//                        .frame(height: 2*20*magnifyBy)
//                        .overlay(Text("7:45~8:45のイベント"))
////                        .position(y: proxy.size.height/1440*465)
//                    Color.clear.onAppear {
//                        print(proxy.size.height)
//                        ScrollViewAllSize = proxy.size.height
//                    }
//
//                }
//            )

            
        }
    }
}

struct CustomMagnification2_Previews: PreviewProvider {
    static var previews: some View {
        CustomMagnification2()
            .previewDevice("iPhone 11 Pro Max")
            .preferredColorScheme(.dark)
    }
}
