//
//  CustomScrollView.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/07/01.
//

import SwiftUI

struct SyncMultipleScrollView: View {
    @State private var scrollViewContentSize = CGFloat(800)
    @State private var scrollViewOffSet = CGFloat(0)

    @State private var offSet: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .top){
            ScrollView(.vertical, showsIndicators: false){
                ForEach(0..<25){ i in
                    HStack{
                        Text("\(i):00")
                            .font(.caption)
                        //                        Text("\(scrollViewContentSize)")
                        //                            .font(.caption)
                        Rectangle()
                            .frame(height: 1)
                    }
                    .offset(y: -6.5)
                    .frame(height: 2*20*1, alignment: .top)
                }
                .offset(x: 0, y: scrollViewOffSet)
                .offset(x: 0, y: -47)
                .background(
                    GeometryReader { geo -> Color in
                        DispatchQueue.main.async {
                            scrollViewContentSize = geo.size.height
                        }
                        return Color.clear
                    }
                )
                .border(.blue)
            }
            
            
            ScrollView(.vertical, showsIndicators: false){
                
                VStack(spacing: 0){
                    ForEach(0..<5){ i in
                        Rectangle()
                            .foregroundColor(.cyan.opacity(0.4))
                            .frame(height: 2.42*40*1, alignment: .top)
                            .border(.red)
                            .position(x: 226, y: 40)
                    }
                }
//                .position(x: 230, y: 643.4)
                .frame(height: scrollViewContentSize, alignment: .top)
                .background(
                    GeometryReader { geo -> Color in
                        DispatchQueue.main.async {
                            scrollViewOffSet = geo.frame(in: .global).minY
                            print(scrollViewOffSet)
                        }
                        return Color.clear
                    }
                )
            }
        }
        
    }
    
}



struct timeTableView: View{
    @State var scrollViewHeight: CGRect = .zero
    
    var body: some View{
        ScrollView(.vertical, showsIndicators: false){
            ForEach(0..<25){ i in
                ZStack(alignment: .top){
                    HStack{
                        Text("\(i):00")
                            .font(.caption)
                            .font(.caption)
                        Rectangle()
                            .frame(height: 1)
                    }
                    //                        .offset(y: -6.5)
                }
                .frame(height: 2*20*1, alignment: .top)
            }
        }
        .overlay(
            GeometryReader { proxy -> Color in
                DispatchQueue.main.async {
                    scrollViewHeight = proxy.frame(in: .named("scroll"))
                    print(scrollViewHeight)
                }
                return Color.clear
            }
            
        )
    }
}

struct SyncMultipleScrollView_Previews: PreviewProvider {
    static var previews: some View {
        SyncMultipleScrollView()
    }
}
