//
//  CustomDrag2.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/09/03.
//

import SwiftUI

struct CustomDrag2: View {
    @State var isDragging = false
    @State var position: CGSize = CGSize(width: 200, height: 300)
    @State var RectTransition: CGSize = CGSize(width: 0, height: 0)
    var buttomposition: CGFloat = CGFloat(500)
    
    var drag: some Gesture{
        
        DragGesture(minimumDistance: 50, coordinateSpace: .local)
            .onChanged { value in
                self.isDragging = true
                self.position = CGSize(width: value.startLocation.x +  value.translation.width,
                                       height: value.startLocation.y +  value.translation.height)
                RectTransition = value.translation
                print("ドラッグ ジェスチャの開始からドラッグ ジェスチャの現在のイベントまでの合計変換。 : \(value.translation)")
                print("ドラッグ ジェスチャの現在のイベントの場所。 : \(value.location)")

            }
            .onEnded{ value in
                self.isDragging = false
                self.position = CGSize(width: value.startLocation.x +  value.translation.width,
                                       height: value.startLocation.y +  value.translation.height)
            }
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 200, height:  (200 + RectTransition.height))
            .position(x: 200, y: 200)
            .gesture(drag)
    }
}

struct CustomDrag2_Previews: PreviewProvider {
    static var previews: some View {
        CustomDrag2()
    }
}
