//
//  CustomAnimationWithBindingProperty2.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/21.
//

import SwiftUI

struct CustomAnimationWithBindingPropertyWithModifire: View {
    @State private var on:Bool = false

    var body: some View {

        VStack{
            // MARK: propertyの変更処理がSwiftUIの画面部品objectから行われるため、WithAnimationコンテナで包めない場合は、Propertyの.animation modifireを使う
            Toggle(isOn: $on.animation(.interactiveSpring(response: 0.4, dampingFraction: 0.5))){
                
                Text("Toggle Here")
                    .padding()
            }
            
            Image(systemName: "arrow.up.circle.fill")
                .frame(height: 400, alignment: on ? .top : .bottom)
                .font(.system(size: 100))
            
            // animation canceled
//                .animation(nil, value: on)
        }
    }
}

struct CustomAnimationWithBindingProperty2_Previews: PreviewProvider {
    static var previews: some View {
        CustomAnimationWithBindingPropertyWithModifire()
    }
}
