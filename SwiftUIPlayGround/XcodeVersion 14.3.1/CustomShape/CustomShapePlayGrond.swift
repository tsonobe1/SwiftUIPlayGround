//
//  CustomShapePlayGrond.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/09/04.
//

import SwiftUI

struct Rec: View {
    let minheight: CGFloat = 100
    @State var height: CGFloat?
    
    var body: some View {
        ScrollView{
            VStack(alignment: .center) {
                Resizer()
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                height = max(minheight, height! + value.translation.height)
                            }
                    )
                    .offset(y: 15)
                    .zIndex(1)
                
                RedRectangle(height: height ?? minheight)
                
                Resizer()
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                height = max(minheight, height! + value.translation.height)
                            }
                    )
                    .offset(y: -15)
                Spacer()
            }
            .onAppear {
                height = minheight
            }
        }
    }
}

struct RedRectangle: View {
    let height: CGFloat
    
    var body: some View {
        Rectangle()
            .fill(Color.red)
            .frame(height: height)
    }
}

struct Resizer: View {
    var body: some View {
        Rectangle()
            .fill(Color.blue)
            .frame(height: 8)
            .cornerRadius(10)
    }
}



