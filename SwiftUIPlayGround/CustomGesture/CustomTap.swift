//
//  CustomTap.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/19.
//

import SwiftUI

struct CustomTap: View {
    @GestureState var up: Bool = false
    @State var count = 0
    
    var body: some View {
        let tapGesture = TapGesture(count: 2)
            .updating(self.$up){ currentState, gestureState, transaction in
            }
            .onEnded{ _ in
                self.count += 1
            }
        
        
        return VStack{
            Text("TAP Count \(self.count)")
            Image(systemName: "star")
                .gesture(tapGesture)
        }
    }
}

struct CustomTap_Previews: PreviewProvider {
    static var previews: some View {
        CustomTap()
    }
}
