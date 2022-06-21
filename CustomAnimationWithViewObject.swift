//
//  CustomDotAnimation.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/21.
//

import SwiftUI

struct CustomAnimationWithViewObject: View {
    @State private var angle: Double = 0
    
    @State private var spin: Double = 0
    @State private var show: Bool = false
    
    var body: some View {
        VStack{
            VStack{
                Button(action: {self.angle += 45.0}){
                    Text("Turn Right 45°")
                }
                Text(Image(systemName: "arrow.up.circle.fill"))
                    .font(.system(size: 100))
                    .rotationEffect(.degrees(angle))
                    .animation(.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0.3), value: angle)
                    .onAppear{
                        self.angle += 180
                    }
            }
            
            Divider()
            
            VStack{
                Button(action: {self.spin += 90}) {
                    Text("Spin")
                }
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")
                    .font(.body).bold().foregroundColor(.orange)
                    .frame(width: 200, height: 200)
                    .border(.orange)
                    .rotation3DEffect(.degrees(spin), axis: (x: 1, y: 100, z: 100))
                    .animation(Animation.easeInOut(duration: 0.8), value: spin)
                    .onAppear{self.spin += 720}
                    .onDisappear{self.spin += 0}
                
            }
            
        }
    }
}

struct CustomDotAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CustomAnimationWithViewObject()
    }
}
