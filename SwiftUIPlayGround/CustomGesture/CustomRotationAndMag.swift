//
//  CustomRotationAndMag.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/21.
//

import SwiftUI

// Gesture型にある順序性・並列性・排他性を設定するモディファイアを利用してイベント受信規則を指定する
struct CustomRotationAndMag: View {
    @State private var angle: Angle = .degrees(.zero)
    @State private var lastAngle: Angle = .degrees(.zero)
    
    @State private var magnifyBy = 1.0
    @State private var lastMagnificationValue = 1.0
    
    @State private var message = "Not Long Tap"
    
    // MARK: rotation gesture
    var rotation: some Gesture{
        RotationGesture()
            .onChanged{ angle in
                self.angle = angle
                self.angle = angle + self.lastAngle
            }
            .onEnded { angle in
                self.lastAngle = self.angle
            }
    }
    
    // MARK: magnification gesture
    var magnification: some Gesture{
        MagnificationGesture()
            .onChanged{ value in
                let changeRate = value / lastMagnificationValue
                magnifyBy *= changeRate
                lastMagnificationValue = value
            }
            .onEnded { value in
                lastMagnificationValue = 1.0
            }
    }
    
    var longTap: some Gesture{
        LongPressGesture()
            .onChanged{ _ in
                self.message = "Long Tap Now"
            }
            .onEnded{ _ in
                self.message = "Not Long Tap"
            }
        
    }
    
    
    var body: some View {
        // MARK: Method1 - Combination of rotatoin and magnification
        let rotationAndMag = SimultaneousGesture(rotation, magnification)
        
        // MARK: Method2 - Combination of rotatoin and magnification
        let rotationAndMag2 = rotation.simultaneously(with: magnification)
        
        let rotationAndMag3 = SequenceGesture(longTap, rotation)
        
        let rotationAndMag4 = rotation.sequenced(before: longTap)
        
        
        Text("SimultaneousGesture")
            .font(.title)
            .bold()
            .foregroundColor(.orange)
            .frame(width: 200, height: 100)
            .border(.red)
            .rotationEffect(self.angle)
            .scaleEffect(magnifyBy)
            .gesture(rotationAndMag)
        
        Text("SimultaneousGesture 2")
            .font(.title)
            .bold()
            .foregroundColor(.orange)
            .frame(width: 200, height: 100)
            .border(.red)
            .rotationEffect(self.angle)
            .scaleEffect(magnifyBy)
            .gesture(rotationAndMag2)
        
        Text("SequenceGesture \(message)")
            .font(.body)
            .bold()
            .foregroundColor(.orange)
            .frame(width: 200, height: 100)
            .border(.red)
            .rotationEffect(self.angle)
            .gesture(rotationAndMag3)
        
    }
}

struct CustomRotationAndMag_Previews: PreviewProvider {
    static var previews: some View {
        CustomRotationAndMag()
    }
}
