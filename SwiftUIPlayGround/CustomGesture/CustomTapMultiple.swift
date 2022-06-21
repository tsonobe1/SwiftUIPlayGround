//
//  CustomTapMultiple.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/21.
//

import SwiftUI

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
            
            // MARK: simultaneously SIMULTANEOUSLY
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
