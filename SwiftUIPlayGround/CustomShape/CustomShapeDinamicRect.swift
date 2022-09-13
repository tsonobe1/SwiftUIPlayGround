//
//  CustomShapeDinamicRect.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/09/04.
//

import SwiftUI

struct CustomDynamicRect: Shape{
    @Binding var lead: Int // 😜
    @Binding var top: Int // 🎉
    @Binding var trail: Int // 🧴
    @Binding var bottom: Int // 💛
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // move -> 始点
        path.move(to: CGPoint(x: lead, y: top))
        
        // moveで指定した位置、もしくは直前の位置から起算して、x, yに指定いた位置まで移動
        path.addLine(to: CGPoint(x: trail, y: top))
        path.addLine(to: CGPoint(x: trail, y: bottom))
        path.addLine(to: CGPoint(x: lead, y: bottom))
        path.addLine(to: CGPoint(x: lead, y: top))
        return path
    }
}


struct CustomShapeDinamicRect: View {
    @State var lead: Int = 0 // 😜
    @State var trail: Int = 0// 🧴
    @State var top: Int = 0 // 🎉
    @State var bottom: Int = 0 // 💛
    
    var body: some View {
        VStack {
            TextField("Lead", value: $lead, formatter: NumberFormatter())
            TextField("Trail", value: $trail, formatter: NumberFormatter())
            TextField("Top", value: $top, formatter: NumberFormatter())
            TextField("Bottom", value: $bottom, formatter: NumberFormatter())

           
            CustomDynamicRect(lead: $lead, top: $top, trail: $trail, bottom: $bottom)
                .overlay(
                    GeometryReader { proxy in
                        Text("TEST")
                            .frame(width: proxy.size.width / 2, height: proxy.size.height / 2)
                            .foregroundColor(.purple)
                    }
                )
            
            
            Text("TEST TEXT TEST TEXT TEST TEXT")
                .background(CustomDynamicRect(lead: $lead, top: $top, trail: $trail, bottom: $bottom))
        }
    }
}
//
//struct DragPlayGroundView: View {
//    @State var lead = 0 // 😜
//    @State var trail =  300 // 🧴
//    @State var top = 0 // 🎉
//    @State var bottom = 300 // 💛
//
//    var body: some View {
//        CustomShapeDinamicRect(lead: $lead, trail: $trail, top: $top, bottom: $bottom)
////            .frame(width: CGFloat(trail-lead), height: CGFloat(bottom-top))
//            .border(.primary)
//            .gesture(
//                DragGesture()
//                    .onChanged{ value in
//                        top = Int(value.translation.height)
//                    }
//            )
//    }
//}

//struct CustomShapeDinamicRect_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomShapeDinamicRect(lead: 100, trail: 300, top: 100, bottom: 300)
//    }
//}
