//
//  CustomAnimationVariation.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/21.
//

import SwiftUI

struct CustomAnimationVariation: View {
    @State private var on:Bool = false
    
    var body: some View {
        VStack{
            Button(action: {self.on.toggle()}) {
                Text("Toggle")
            }
            
            VStack(alignment: .leading){
                Group{
                    Text("linear").bold()
                    Image(systemName: on ? "arrow.right.circle.fill" : "arrow.left.circle.fill")
                        .frame(width: 300, alignment: on ? .leading : .trailing)
                        .font(.system(size: 40))
                        .foregroundColor(Color(UIColor.rand1))
                        .animation(.linear, value: on)
                    
                    
                    //                        Image(systemName: on ? "arrow.right.circle.fill" : "arrow.left.circle.fill")
                    //                            .frame(width: 300, alignment: on ? .leading : .trailing)
                    //                            .font(.system(size: 40))
                    //                            .animation(.linear(duration: 2), value: on)
                }
                
                Group{
                    Text("easeIn").bold()
                    Image(systemName: on ? "arrow.right.circle.fill" : "arrow.left.circle.fill")
                        .frame(width: 300, alignment: on ? .leading : .trailing)
                        .font(.system(size: 40))
                        .foregroundColor(Color(UIColor.rand1))
                        .animation(.easeIn, value: on)
                    
                    
                    //                        Image(systemName: on ? "arrow.right.circle.fill" : "arrow.left.circle.fill")
                    //                            .frame(width: 300, alignment: on ? .leading : .trailing)
                    //                            .font(.system(size: 40))
                    //                            .animation(.easeIn(duration: 0.35), value: on)
                }
                
                Group{
                    Text("easeInOut").bold()
                    Image(systemName: on ? "arrow.right.circle.fill" : "arrow.left.circle.fill")
                        .frame(width: 300, alignment: on ? .leading : .trailing)
                        .font(.system(size: 40))
                        .foregroundColor(Color(UIColor.rand1))
                        .animation(.easeInOut, value: on)
                    
                    
                    //                        Image(systemName: on ? "arrow.right.circle.fill" : "arrow.left.circle.fill")
                    //                            .frame(width: 300, alignment: on ? .leading : .trailing)
                    //                            .font(.system(size: 40))
                    //                            .animation(.easeInOut(duration: 0.35), value: on)
                }
                
                Group{
                    Text("easeOut").bold()
                    Image(systemName: on ? "arrow.right.circle.fill" : "arrow.left.circle.fill")
                        .frame(width: 300, alignment: on ? .leading : .trailing)
                        .font(.system(size: 40))
                        .foregroundColor(Color(UIColor.rand1))
                        .animation(.easeOut, value: on)
                    
                    
                    
                    //                        Image(systemName: on ? "arrow.right.circle.fill" : "arrow.left.circle.fill")
                    //                            .frame(width: 300, alignment: on ? .leading : .trailing)
                    //                            .font(.system(size: 40))
                    //                            .animation(.easeOut(duration: 0.35), value: on)
                }
                
                Group{
                    Text("spring").bold()
                    Image(systemName: on ? "arrow.right.circle.fill" : "arrow.left.circle.fill")
                        .frame(width: 300, alignment: on ? .leading : .trailing)
                        .font(.system(size: 40))
                        .foregroundColor(Color(UIColor.rand1))
                        .animation(.spring(), value: on)
                    
                    
                    Image(systemName: on ? "arrow.right.circle.fill" : "arrow.left.circle.fill")
                        .frame(width: 300, alignment: on ? .leading : .trailing)
                        .font(.system(size: 40))                            .foregroundColor(Color(UIColor.rand1))
                    // response : 1サイクルにかかる時間
                    // dampingFraction : １サイクル動作における減衰率
                    //      値が大きいほど、ダンピング効果が出て振動が抑制される。0.01.0で指定
                        .animation(.spring(response: 0.5, dampingFraction: 3), value: on)
                }
                
                Group{
                    Text("interactiveSpring").bold()
                    Image(systemName: on ? "arrow.right.circle.fill" : "arrow.left.circle.fill")
                        .frame(width: 300, alignment: on ? .leading : .trailing)
                        .font(.system(size: 40))
                        .foregroundColor(Color(UIColor.rand1))
                        .animation(.interactiveSpring(), value: on)
                    
                    
                    Image(systemName: on ? "arrow.right.circle.fill" : "arrow.left.circle.fill")
                        .frame(width: 300, alignment: on ? .leading : .trailing)
                        .font(.system(size: 40))
                        .foregroundColor(Color(UIColor.rand1))
                        .animation(.interactiveSpring(response: 0.5, dampingFraction: 3), value: on)
                }
                
                Group{
                    Text("interpolatingSpring").bold()
                    Image(systemName: on ? "arrow.right.circle.fill" : "arrow.left.circle.fill")
                        .frame(width: 300, alignment: on ? .leading : .trailing)
                        .font(.system(size: 40))
                        .foregroundColor(Color(UIColor.rand1))
                    // mass : 質量。値が大きいほど触れる時間が長くなる
                    // stiffness : バネの剛性係数。外力による変形への抵抗力
                    // damping : １サイクル動作における減衰率。振動の抑制度合いを調整
                    // initialVelocity : 初期速度。gestureの速度をそのままアニメーションに反映させるのに便利
                        .animation(.interpolatingSpring(mass: 0.2, stiffness: 2, damping: 1, initialVelocity: 5), value: on)
                    
                }
            }
        }
    }
}

struct CustomAnimationVariation_Previews: PreviewProvider {
    static var previews: some View {
        CustomAnimationVariation()
    }
}
