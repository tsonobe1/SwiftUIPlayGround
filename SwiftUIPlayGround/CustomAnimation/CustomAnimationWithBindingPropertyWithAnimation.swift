//
//  CustomAnimationWithBindingProperty.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/21.
//

import SwiftUI

extension UIColor {
    static var rand1 : UIColor {
        let r = CGFloat.random(in: 0 ... 255) / 255.0
        let g = CGFloat.random(in: 0 ... 255) / 255.0
        let b = CGFloat.random(in: 0 ... 255) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: 5.0)
    }
}

struct CustomAnimationWithBindingPropertyWithAnimation: View {
    @State private var on:Bool = false
    
    var body: some View {
        
        VStack{
            Button(action: {
                // MARK: WithAnimationコンテナでpropertyの変更処理を包むことで、onプロパティがアニメーション処理対象であることを宣言する
                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.5)){
                    self.on.toggle()
                }
            }){
                Text("Toggle")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color(UIColor.rand1))
            }
            Spacer()
            HStack{
                ZStack{
                    Rectangle()
                        .frame(width:8, height: 450)
                        .foregroundColor(Color(UIColor.rand1)).opacity(0.1)
                    
                    Image(systemName: "arrow.up.circle.fill")
                        .rotationEffect(on ? .degrees(180) : .degrees(360))
                        .frame(height: 500, alignment: on ? .top: .bottom )
                        .font(.system(size: 100))
                        .foregroundColor(Color(UIColor.rand1))
                }
                
                ZStack{
                    Rectangle()
                        .frame(width:8, height: 450)
                        .foregroundColor(Color(UIColor.rand1)).opacity(0.1)
                Image(systemName: "arrow.up.circle.fill")
                    .rotationEffect(on ? .degrees(360) : .degrees(180))
                    .frame(height: 500, alignment: on ? .bottom: .top )
                    .font(.system(size: 100))
                    .foregroundColor(Color(UIColor.rand1))
                }
                
                ZStack{
                    Rectangle()
                        .frame(width:8, height: 450)
                        .foregroundColor(Color(UIColor.rand1)).opacity(0.1)
                Image(systemName: "arrow.up.circle.fill")
                    .rotationEffect(on ? .degrees(180) : .degrees(360))
                    .frame(height: 500, alignment: on ? .top: .bottom )
                    .font(.system(size: 100))
                    .foregroundColor(Color(UIColor.rand1))
                }
            }
            Spacer()
        }
    }
}

struct CustomAnimationWithBindingProperty_Previews: PreviewProvider {
    static var previews: some View {
        CustomAnimationWithBindingPropertyWithAnimation()
    }
}
