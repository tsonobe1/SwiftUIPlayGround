//
//  CustomTapMultiple.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/21.
//

import SwiftUI

// ビュー・モディファイアーによりジェスチャー・イベントの受け取り優先順位を指定する
struct CustomTapMultiple: View {
    @State private var insideCount: Int = 0
    @State private var outsideCount: Int = 0

    var tap1: some Gesture{
        TapGesture(count: 1)
            .onEnded{ _ in
                insideCount += 1
            }
    }
    
    var tap2: some Gesture{
        TapGesture(count: 1)
            .onEnded{ _ in
                outsideCount += 1
            }
    }
    
    var body: some View {
        VStack{
            Button("RESET") {
                insideCount = 0
                outsideCount = 0
            }
            
            // MARK: DEFAULT
            // InsideとOutsideは重なっている。クリックすると優先度が高い（先に呼び出された）Gestureのみが反応する
            VStack(alignment: .leading, spacing: 20){
                Text("Default").font(.body).bold()
                Text("insideをタップしてもoutsideは反応しない").font(.body)
                Text("Outside Count : \(outsideCount)")
                Text("Inside Count : \(insideCount)")
                    .gesture(tap1)
            }
            .frame(width: 350, height: 180)
            .border(.indigo)
            .contentShape(Rectangle())
            .gesture(tap2)
            
            // MARK: HIGH PRIORITY
            // highPriorityGestureで呼び出したGesutreが優先される
            VStack{
                VStack(alignment: .leading, spacing: 20){
                    Text("Default").font(.body).bold()
                    Text("insideをタップするとoutsideが反応する").font(.body)
                    Text("Outside Count : \(outsideCount)")
                    Text("Inside Count : \(insideCount)")
                        .gesture(tap1)
                }
                .frame(width: 350, height: 180)
                .border(.indigo)
                .contentShape(Rectangle())
                .highPriorityGesture(tap2) // ←
            }
            
            // MARK: SIMULTANEOUSLY
            // simultaneousGestureで呼び出すと、優先度の高いGesture(ここでいうinside)と同時に反応する
            VStack{
                VStack(alignment: .leading, spacing: 20){
                    Text("Default").font(.body).bold()
                    Text("insideをタップすると両方反応する").font(.body)
                    Text("Outside Count : \(outsideCount)")
                    Text("Inside Count : \(insideCount)")
                        .gesture(tap1)
                }
                .frame(width: 350, height: 180)
                .border(.indigo)
                .contentShape(Rectangle())
                .simultaneousGesture(tap2)
            }
        }
    }
}

struct CustomTapMultiple_Previews: PreviewProvider {
    static var previews: some View {
        CustomTapMultiple()
    }
}
