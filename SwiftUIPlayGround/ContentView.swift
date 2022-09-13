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
                    NavigationLink(destination: Rec()){ Text("CustomShapeDinamicRect")}
                }
                
                Section(header: Text("Custom Gesture")){
                    NavigationLink(destination: CustomTap()){
                        Text("CustomTap")
                    }
                    NavigationLink(destination: CustomDrag()){
                        Text("CustomDrag")
                    }
                    NavigationLink(destination: CustomDrag2()){
                        Text("CustomDrag2")
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
                
                Section(header: Text("ScrollView")){
                    NavigationLink(destination: SyncMultipleScrollView()){
                        Text("Sync1")
                    }
                    NavigationLink(destination: SyncMultipleScrollView4()){
                        Text("Sync2")
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
                Section(header: Text("Alignment")){
                    NavigationLink(destination: Alignment()){
                        Text("Alignment")
                    }
                    NavigationLink(destination: AlignmentGuide()){
                        Text("AlignmentGuide")
                    }
                    NavigationLink(destination: AlignmentTextBaseLine()){
                        Text("AlignmentTextBaseLine")
                    }
                }
                Section(header: Text("Layout")){
                    NavigationLink(destination: BackGroundAndOverlay()){
                        Text("BackGroundAndOverlay")
                    }
                    NavigationLink(destination: Layout()){
                        Text("Latout")
                    }
                    NavigationLink(destination: CustomText()){
                        Text("CustomText")
                    }
                }
                Section(header: Text("Input")){
                    NavigationLink(destination: CustomTextField()){
                        Text("CustomTextField")
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
