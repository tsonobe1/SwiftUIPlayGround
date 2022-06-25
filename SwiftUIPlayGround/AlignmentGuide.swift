//
//  AlignmentGuide.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/25.
//

import SwiftUI

struct AlignmentGuide: View {
    @State private var alignment: HorizontalAlignment = .leading
    var body: some View {
        VStack{
            
            // MARK: .alignmentGuideの第一引数は、コンテナのAlignmentと一致している場合のみ有効になる //
            VStack(alignment: self.alignment){
                Rectangle()
                    .frame(width: 100, height: 100)
                    .alignmentGuide(.leading) { _ in 50 }
                    .overlay(Text("Left of the Alignment Guide Line").foregroundColor(.white))
                Rectangle()
                    .frame(width: 100, height: 100)
                    .alignmentGuide(.leading) { _ in -50 }
                    .overlay(Text("Right of the Alignment Guide Line").foregroundColor(.white))
                Rectangle()
                    .frame(width: 100, height: 100)
                    .alignmentGuide(self.alignment, computeValue: { d in d[.leading] })
            }
            Spacer()
            
            
            // MARK: .alignmentGuideの第一引数は、コンテナのAlignmentと一致している場合のみ有効になる //
            HStack(alignment: .bottom){
                Rectangle()
                    .frame(width: 100, height: 100)
                    .alignmentGuide(.bottom) { _ in 50 }
                    .overlay(Text("+50").foregroundColor(.white))
                Rectangle()
                    .frame(width: 100, height: 100)
                    .alignmentGuide(.bottom) { _ in -50 }
                    .overlay(Text("-50").foregroundColor(.white))
                Rectangle()
                    .frame(width: 100, height: 100)
                    // ↓ not enabled
                    .alignmentGuide(.top) { _ in -50 }
            }
            
            /*
             AlignmentGuide引数であるComputedValueに値を指定することで、原点からどこの位置にAlignment guide線を配置するかを任意に決められる(原点とは、HStackなら上端辺・VStackなら左端辺)
             
             ConputedValueにはCGFloatを指定でき、
              ①実数をハードコードする
              ②ViewDimensions型parameterを使う
             ことができる。
             
             
             */
            
        }
    }
}

struct AlignmentGuide_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentGuide()
    }
}
