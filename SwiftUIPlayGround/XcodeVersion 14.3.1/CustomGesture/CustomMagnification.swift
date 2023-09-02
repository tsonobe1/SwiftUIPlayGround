//
//  CustomMagnification.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/19.
//

import SwiftUI

extension UIColor {
    static var rand : UIColor {
        let r = CGFloat.random(in: 0 ... 255) / 255.0
        let g = CGFloat.random(in: 0 ... 255) / 255.0
        let b = CGFloat.random(in: 0 ... 255) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: 5.0)
    }
}

struct CustomMagnification: View {
    
    @State private var timeBarheight: CGFloat =  100.0
    
    @State private var magnifyBy = 1.0
    @State private var lastMagnificationValue = 1.0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            ForEach(0..<25){ i in
                ZStack(alignment: .top){
                    HStack(){
                        Text("\(i):00")
                            .font(.caption)
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.secondary)
                            .opacity(0.5)
                    }
                    .frame(minHeight: 50, maxHeight: 400, alignment: .top)
                    .offset(y: -6.5)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .opacity(0.4)
                        .foregroundColor(Color(UIColor.rand))
                        .frame(minHeight: 50, maxHeight: 400)
                     
                }
                .frame(height: magnifyBy*20, alignment: .top)
                .frame(minHeight: 50, maxHeight: 400, alignment: .top)
            }
            
            .padding()
        }
        .gesture(MagnificationGesture()
            .onChanged{ value in
                let changeRate = value / lastMagnificationValue
                magnifyBy *= changeRate
                lastMagnificationValue = value
//                self.timeBarheight = value*20
            }
            .onEnded { value in
                lastMagnificationValue = 1.0
            }
        )
    }
}

struct CustomMagnification_Previews: PreviewProvider {
    static var previews: some View {
        CustomMagnification()
    }
}
