//
//  CustomTransitionOther.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/22.
//

import SwiftUI

struct CustomTransitionOther: View {
    @State private var on: Bool = false
    @State private var angel: Double = 0

    var body: some View {
        VStack{
            Button(action: { withAnimation(.easeIn(duration: 0.4)){self.angel += 45; self.on.toggle()}}){
                Text("Push")
            }
            // すでに表示済みのviewはAnimationだけが適用される。transitionは反映されない。
            Image(systemName: "arrow.up.circle.fill")
                .rotationEffect(.degrees(self.angel))
                .foregroundColor(.purple)
                .font(.system(size: 78))
                .transition(.move(edge: .leading))
                .padding(30)
            
            
            if on {
                // 表示の有無が切り替わるViewについてはanimationが動かず、transitionが動く
                Image(systemName: "arrow.up.circle.fill")
                    .rotationEffect(.degrees(self.angel))
                    .foregroundColor(.yellow)
                    .font(.system(size: 78))
                    .transition(.move(edge: .leading))
            } else {
                Image(systemName: "arrow.up.circle.fill")
                    .rotationEffect(.degrees(self.angel))
                    .foregroundColor(.secondary)
                    .font(.system(size: 78))
            }
            
            Spacer()
            
            if on {
                // Transitionの合成

            Image(systemName: "paperplane.fill")
                .rotationEffect(.degrees(self.angel))
                .foregroundColor(.yellow)
                .font(.system(size: 78))
                .transition(AnyTransition.opacity.combined(with: .slide).combined(with: .scale).combined(with: .offset(x: -300, y: -300)))
                
                // 表示と非表示で異なるtransition
                Image(systemName: "umbrella.fill")
                    .rotationEffect(.degrees(self.angel))
                    .foregroundColor(Color(UIColor.rand1))
                    .font(.system(size: 78))
                    .transition(.asymmetric(insertion: .slide, removal: .scale))
            }
        }
    }
}

struct CustomTransitionOther_Previews: PreviewProvider {
    static var previews: some View {
        CustomTransitionOther()
    }
}
