//
//  GeometryReaderPlayGround.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/23.
//

import SwiftUI

struct GeometryReaderSizeSafeArea: View {
    var body: some View {
        GeometryReader { geometry in
            VStack{
                // MARK: Geometry Proxy, size Property
                // Geometry Reader自身のサイズ(safeAreaの内外含む)がわかる
                // CGSize型で、width, heightがそれぞれCGFloatで定義されている
                VStack{
                    // デバイスのsafeareaの内側と外側すべてを含んだサイズ↓
                    Text("デバイスのsafeAreaを除くサイズ")
                        .bold()
                    Text("\(geometry.size.width)")
                    Text("\(geometry.size.height)")
                }
                // デバイスの全サイズの、width/1.2 height/8をframeに指定
                .frame(width: geometry.size.width/1.2, height: geometry.size.height/8)
                .background(.thinMaterial)
                
                
                // MARK: Geometry Proxy, safeAreaInsets Property
                // safeAreaのサイズがわかる
                // EdgeInsets型で、top, trailing, bottom, leadingがそれぞれCGFloadで定義されている
                VStack{
                    Text("geometry proxyから取得したsafeAreaのサイズ")
                        .bold()
                    Text("top : \(geometry.safeAreaInsets.top)")
                    Text("trailing : \(geometry.safeAreaInsets.trailing)")
                    Text("bottom : \(geometry.safeAreaInsets.bottom)")
                    Text("leading : \(geometry.safeAreaInsets.leading)")
                }
                .padding()
                // ↓のheightは、safeAreaだけのサイズ
                .frame(width: geometry.size.width,
                       height: geometry.size.height - (geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom))
                .background(.teal).opacity(0.4)
            }
        }

    }
}

struct GeometryReaderPlayGround_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderSizeSafeArea()
    }
}
