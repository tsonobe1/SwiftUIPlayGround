//
//  ContentView.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Custom Shape")){
                    NavigationLink(destination: CustomShapeRect()){
                        Text("CustomShapeRect")
                    }
                    NavigationLink(destination: CustomShapeLine()){
                        Text("CustomShapeLine")
                    }
                    NavigationLink(destination: CustomShapeOther()){
                        Text("CustomShapeOther")
                    }
                }
                
                Section(header: Text("Custom Gesture")){
                    NavigationLink(destination: CustomTap()){
                        Text("CustomTap")
                    }
                    NavigationLink(destination: CustomDrag()){
                        Text("CustomDrag")
                    }
                    NavigationLink(destination: CustomMagnification()){
                        Text("CustomMagnification")
                    }
                    NavigationLink(destination: CustomTapMultiple()){
                        Text("CustomTapMultiple")
                    }
                    NavigationLink(destination: CustomRotationAndMag()){
                        Text("CustomRotationAndMag")
                    }
                }
                
                Section(header: Text("Custom Animation")){
                    NavigationLink(destination: CustomAnimationWithViewObject()){
                        Text("CustomAnimationWithViewObject")
                    }
                    NavigationLink(destination: CustomAnimationWithBindingPropertyWithAnimation()){
                        Text("CustomAnimationWithBindingPropertyWithAnimation")
                    }
                    NavigationLink(destination: CustomAnimationWithBindingPropertyWithModifire()){
                        Text("CustomAnimationWithBindingPropertyWithModifire")
                    }
                    NavigationLink(destination: CustomAnimationVariation()){
                        Text("CustomAnimationVariation")
                    }
                }
                
                Section(header: Text("Transition")){
                    NavigationLink(destination: TransitionSwitchView()){
                        Text("CustomTransition")
                    }
                    NavigationLink(destination: CustomTransitionOther()){
                        Text("CustomTransitionOther")
                    }
                }
                
            }.navigationTitle("🍎Swift UI Playground")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
