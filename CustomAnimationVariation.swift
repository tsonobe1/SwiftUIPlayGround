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
            ScrollView{
                VStack{
                    Group{
                        Text("linear")
                        Image(systemName: "arrow.up.circle.fill")
                            .frame(width: 300, alignment: on ? .leading : .trailing)
                            .font(.system(size: 40))
                            .animation(.linear, value: on)
                        
                        
                        Image(systemName: "arrow.up.circle.fill")
                            .frame(width: 300, alignment: on ? .leading : .trailing)
                            .font(.system(size: 40))
                            .animation(.linear(duration: 0.35), value: on)
                    }
                    
                    Group{
                        Text("easeIn")
                        Image(systemName: "arrow.up.circle.fill")
                            .frame(width: 300, alignment: on ? .leading : .trailing)
                            .font(.system(size: 40))
                            .animation(.easeIn, value: on)
                        
                        
                        Image(systemName: "arrow.up.circle.fill")
                            .frame(width: 300, alignment: on ? .leading : .trailing)
                            .font(.system(size: 40))
                            .animation(.easeIn(duration: 0.35), value: on)
                    }
                    
                    Group{
                        Text("easeInOut")
                        Image(systemName: "arrow.up.circle.fill")
                            .frame(width: 300, alignment: on ? .leading : .trailing)
                            .font(.system(size: 40))
                            .animation(.easeInOut, value: on)
                        
                        
                        Image(systemName: "arrow.up.circle.fill")
                            .frame(width: 300, alignment: on ? .leading : .trailing)
                            .font(.system(size: 40))
                            .animation(.easeInOut(duration: 0.35), value: on)
                    }
                    
                    Group{
                        Text("easeOut")
                        Image(systemName: "arrow.up.circle.fill")
                            .frame(width: 300, alignment: on ? .leading : .trailing)
                            .font(.system(size: 40))
                            .animation(.easeOut, value: on)
                        
                        
                        Image(systemName: "arrow.up.circle.fill")
                            .frame(width: 300, alignment: on ? .leading : .trailing)
                            .font(.system(size: 40))
                            .animation(.easeOut(duration: 0.35), value: on)
                    }
                    
                    Group{
                        Text("spring")
                        Image(systemName: "arrow.up.circle.fill")
                            .frame(width: 300, alignment: on ? .leading : .trailing)
                            .font(.system(size: 40))
                            .animation(.spring(), value: on)
                        
                        
                        Image(systemName: "arrow.up.circle.fill")
                            .frame(width: 300, alignment: on ? .leading : .trailing)
                            .font(.system(size: 40))
                            .animation(.spring(response: 0.5, dampingFraction: 3), value: on)
                    }
                    
                    Group{
                        Text("interactiveSpring")
                        Image(systemName: "arrow.up.circle.fill")
                            .frame(width: 300, alignment: on ? .leading : .trailing)
                            .font(.system(size: 40))
                            .animation(.interactiveSpring(), value: on)
                        
                        
                        Image(systemName: "arrow.up.circle.fill")
                            .frame(width: 300, alignment: on ? .leading : .trailing)
                            .font(.system(size: 40))
                            .animation(.interactiveSpring(response: 0.5, dampingFraction: 3), value: on)
                    }
                    
                    Group{
                        Text("interpolatingSpring")
                        Image(systemName: "arrow.up.circle.fill")
                            .frame(width: 300, alignment: on ? .leading : .trailing)
                            .font(.system(size: 40))
                            .animation(.interpolatingSpring(mass: 0.2, stiffness: 1, damping: 2, initialVelocity: 5), value: on)
                        
                    }
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
