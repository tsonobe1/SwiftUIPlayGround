//
//  CustomViewBuilder.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/26.
//

import SwiftUI

struct CustomViewBuilder: View {
    var body: some View {
        VStack(content: { () -> TupleView<(Text, Text)> in
            return ViewBuilder.buildBlock(
                Text("AAA"),
                Text("BBB")
            )
        })
    }
}

struct CustomViewBuilder_Previews: PreviewProvider {
    static var previews: some View {
        CustomViewBuilder()
    }
}
