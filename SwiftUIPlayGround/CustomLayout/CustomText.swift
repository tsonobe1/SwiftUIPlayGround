//
//  CustomText.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/29.
//

import SwiftUI

struct CustomText: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10){
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et")
                    .underline(color: .red)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et")
                    .strikethrough(color: .red)
                
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et")
                    .baselineOffset(32)
                
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et")
                    .tracking(10)
                
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et")
                    .kerning(10)
            }
            VStack{
                Text("Lorem ipsum dolor sit")
                    .allowsTightening(true)
                
                
                Text("Lorem ipsum dolor sit")
                    .minimumScaleFactor(0.2)
                
                
                Text("Lorem ipsum dolor sit")
                    .truncationMode(.head)
                
                
                Text("Lorem ipsum dolor sit")
                    .truncationMode(.middle)
                
                Text("Lorem ipsum dolor sit")
                    .truncationMode(.tail)
                
                
                Text("Lorem ipsum dolor sitflksdklfsdfmklsdmflsdmflksdmflmsdfkmsdfkldslkfmsdkl")
                    .fixedSize(horizontal: true, vertical: true)
            }
        }
    }
}

struct CustomText_Previews: PreviewProvider {
    static var previews: some View {
        CustomText()
    }
}
