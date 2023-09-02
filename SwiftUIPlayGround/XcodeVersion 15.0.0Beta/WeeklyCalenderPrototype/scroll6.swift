//
//  scroll6.swift
//  imonit
//
//  Created by 薗部拓人 on 2023/08/26.
//

import SwiftUI

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

struct scroll6: View {
    @State private var scrollOffset: CGFloat = 0
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<10) { i in
                        Text("Item \(i)")
                            .frame(width: 100, height: 100)
                            .background(Color.red)
                    }
                }
                .background(GeometryReader {
                    Color.clear.preference(key: ScrollOffsetPreferenceKey.self, value: -$0.frame(in: .named("scroll")).origin.x)
                })
            }
            .coordinateSpace(name: "scroll")
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { offset in
                scrollOffset = offset
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<10) { i in
                        Text("Item \(i)")
                            .frame(width: 100, height: 100)
                            .background(Color.blue)
                    }
                }
                .offset(x: -scrollOffset)
            }
        }
    }
}


#Preview {
    scroll6()
}
