//
//  scroll.swift
//  imonit
//
//  Created by 薗部拓人 on 2023/08/22.
//

import SwiftUI

struct scroll: View {
    @State var AxisY: CGFloat = 0
    @State var hourHeihgt = 80.0
    
    var list = [1,2,3,4,5,6]
    var body: some View {
        HStack(spacing: 0){
            VStack(spacing: 0) {
                Text("1")
                    .foregroundStyle(.clear)
                // hour labels
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0){
                        ForEach(0..<24, id: \.self) { hour in
                            Rectangle() // Horizontal Divider
                                .frame(height: hourHeihgt)
                                .foregroundStyle(.clear)
                                .overlay{
                                    Text("\(String(format: "%02d", hour)):00")
                                        .font(Font(UIFont.monospacedDigitSystemFont(ofSize: 11.0, weight: .regular)))
                                }
                        }
                    }
                    .offset(y: AxisY)
                }
            }
            .containerRelativeFrame(.horizontal, count: 10, span: 1, spacing: 0)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(list, id: \.self) { i in
                        VStack(spacing: 0) {
                            Text("\(AxisY)")
                            ScrollView(.vertical) {
                                HStack(spacing: 0){
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 1)
                                        .foregroundColor(.primary)
                                        .opacity(0.3)
                                    VStack(spacing: 0){
                                        ForEach(0..<24, id: \.self) { x in
                                            Rectangle()
                                                .frame(height: hourHeihgt)
                                                .foregroundStyle(.clear)
                                                .overlay{
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .frame(height: 1)
                                                        .foregroundColor(.primary)
                                                        .opacity(0.3)
                                                }
                                        }
                                    }
                                    .overlay(GeometryReader { proxy -> Color in
                                        DispatchQueue.main.async {
                                            AxisY = proxy.frame(in: .named("ScrollView")).origin.y
                                        }
                                        return Color.clear
                                    })
                                }
                                .offset(y: AxisY)

                            }
                            .coordinateSpace(name: "ScrollView")
//                            .containerRelativeFrame(.horizontal, count: 10, span: 10, spacing: 0)
                        }
                        
                    }
                    .containerRelativeFrame(.horizontal, count: 7, span: 2, spacing: 0)
                }
                .scrollTargetLayout()

            }
            .containerRelativeFrame(.horizontal, count: 10, span: 9, spacing: 0)
            .scrollTargetBehavior(.viewAligned)
        }
        
        
    }
}

#Preview {
    scroll()
}
