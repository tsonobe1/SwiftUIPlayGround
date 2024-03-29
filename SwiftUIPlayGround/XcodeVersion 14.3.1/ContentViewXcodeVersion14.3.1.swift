//
//  ContentViewXcodeVersion14.3.1.swift
//  SwiftUIPlayGround
//
//  Created by tsonobe on 2023/09/02.
//

import SwiftUI

struct ContentViewXcodeVersion14_3_1: View {
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
                    NavigationLink(destination: SyncMultipleScrollView5()){
                        Text("Sync2")
                    }
                    NavigationLink(destination: MonthlyCalender()){
                        Text("MonthlyCalender")
                    }
                    NavigationLink(destination: ListBackGroundTest()){
                        Text("ListBackGround")
                    }
                }
                
                Section(header: Text("Custom Animation")){
                    NavigationLink(destination: CustomAnimationWithViewObject()){
                        Text("CustomAnimationWithViewObject")
                    }
                    NavigationLink(destination: CustomAnimationWithBindingProperty1()){
                        Text("CustomAnimationWithBindingProperty1")
                    }
                    NavigationLink(destination: CustomAnimationWithBindingProperty2()){
                        Text("CustomAnimationWithBindingProperty2")
                    }
                    NavigationLink(destination: CustomAnimationVariation()){
                        Text("CustomAnimationVariation")
                    }
                    NavigationLink(destination: Fadeinout()){
                        Text("Fadeinout")
                    }
                    NavigationLink(destination: Fadeinout2()){
                        Text("Fadeinout2")
                    }
                }
                Section(header: Text("Debug")){
                    NavigationLink(destination: PrintDebug()){Text("Print")}
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

struct ContentViewXcodeVersion14_3_1_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewXcodeVersion14_3_1()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
