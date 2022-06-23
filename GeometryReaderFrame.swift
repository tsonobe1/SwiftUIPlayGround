//
//  GeometryReaderFrame.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/23.
//

import SwiftUI

struct GeometryReaderFrame: View {
    var body: some View {
        ScrollView{
            VStack{
                
                GeometryReader{ geometry in
                    VStack(spacing: 0){
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.pink)
                            .overlay(VStack(alignment: .leading) {
                                Text("X: \(geometry.frame(in: .global).origin.x)")
                                Text("Y: \(geometry.frame(in: .global).origin.y)")
                                Text("width: \(geometry.frame(in: .global).width)")
                                Text("height: \(geometry.frame(in: .global).height)")
                            }
                                .foregroundColor(.white)
                                .font(.body)
                                .padding())
                        
                        GeometryReader { proxy in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.mint)
                            .frame(width: proxy.frame(in: .local).midX)
                            .overlay(VStack(alignment: .leading) {
                                Text("X: \(proxy.frame(in: .global).origin.x)")
                                Text("Y: \(proxy.frame(in: .global).origin.y)")
                                Text("width: \(proxy.frame(in: .global).width)")
                                Text("height: \(proxy.frame(in: .global).height)")
                            }
                                .foregroundColor(.white)
                                .font(.body)
                                .padding())
                        }
                        .background(.gray)

                        
                        GeometryReader { proxy2 in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.mint)
                            .frame(width: proxy2.frame(in: .local).midX/2)
                            .overlay(VStack(alignment: .leading) {
                                Text("X: \(proxy2.frame(in: .global).origin.x)")
                                Text("Y: \(proxy2.frame(in: .global).origin.y)")
                                Text("width: \(proxy2.frame(in: .global).width)")
                                Text("height: \(proxy2.frame(in: .global).height)")
                                Text("midX: \(proxy2.frame(in: .global).midX)")

                            }
                                .foregroundColor(.white)
                                .font(.body)
                                .padding())
                        }
                        .background(.ultraThinMaterial)
                    }
                }
                .background(.black)
                .frame(height: 390)
                Spacer()
                
                
            }
        }
    }
}

struct GeometryReaderFrame_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderFrame()
    }
}
