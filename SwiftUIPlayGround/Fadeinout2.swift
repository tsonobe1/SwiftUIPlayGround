//
//  Fadeinout2.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/09/15.
//

import SwiftUI

struct Fadeinout2: View {
    @Namespace private var animation
    @State private var flag = false
    
    var body: some View {
        VStack {
            Button("Button") {
                withAnimation(Animation.easeInOut) {
                    flag.toggle()
                }
            }
            
//            if !flag {
//                Text("Hello, World!")
//                    .matchedGeometryEffect(id: "Title", in: animation)
//            }
            
            Spacer()

            if flag {
                Text("Hello, World!")
//                    .matchedGeometryEffect(id: "Title", in: animation)
            }
//            if !flag {
//                Text("Hello, World!")
//                    .animation(.easeInOut)
//                    .matchedGeometryEffect(id: "Title", in: animation)
//            }
        }
        .toolbar {
            ToolbarItem(placement: .principal){
                if !flag {
                    Text("Hello AAAFSDFSDFSDFDS")
//                        .matchedGeometryEffect(id: "Title", in: animation)
                }
            }
        }
    }
}

struct Fadeinout2_Previews: PreviewProvider {
    static var previews: some View {
        Fadeinout2()
    }
}
