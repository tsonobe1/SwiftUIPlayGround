//
//  CustomShapeOther.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/18.
//

import SwiftUI

struct CustomEllipse: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addEllipse(in: CGRect(x: 0, y: 0, width: rect.width, height: rect.height))
        return path
    }
}

struct CustomArc: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let startAngle: Angle = .degrees(0 - 90)
        let endAngle: Angle = .degrees(120 - 120)
        
        // center -> 円の中心
        let center = CGPoint(x: rect.width * 0.5, y: rect.height * 0.5)
        
        path.move(to: center)
        path.addArc(center: center, radius: 100, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.addLine(to: center)
        return path
    }
}

struct CustomArc2: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let startAngle: Angle = .degrees(0 - 90)
        let endAngle: Angle = .degrees(120 - 120)
        let center = CGPoint(x: rect.width * 0.5, y: rect.height * 0.5)
        
        path.move(to: center)
        path.addArc(center: center, radius: 100, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        path.addLine(to: center)
        return path
    }
}


struct CustomBezier: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.height/2))
        // addCurve -> .moveで決めた始点から、もしくは前の位置から起算して、parameterで指定した位置を終点として、そこまでベジェ曲線を書く。２つのコントロールで曲線を変えられる
        path.addCurve(to: CGPoint(x: rect.width, y: rect.height/2),
                      control1: CGPoint(x: rect.width/2, y: rect.height*2),
                      control2: CGPoint(x: rect.width/2, y: -rect.height))
        return path
    }
}

struct CustomBezier2: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.height/2))
        // add QuadCueve -> .moveで決めた始点から、もしくは前の位置から起算して、parameterで指定した位置を終点として、そこまでベジェ曲線を書く。1つのコントロールで曲線を変えられる
        path.addQuadCurve(to: CGPoint(x: rect.width, y: rect.height/2),
                          control: CGPoint(x: rect.width/2, y: rect.height))
        return path
    }
}


struct CustomShapeOther: View {
    var body: some View {
        VStack{
            ScrollView{
                CustomEllipse()
                    .rotation(.degrees(20))
                    .stroke(.pink, lineWidth: 10)
                    .frame(width: 200, height: 100)
                
                HStack{
                    CustomArc()
                        .foregroundColor(.gray)
                        .frame(width: 250, height: 250)
                    
                    CustomArc2()
                        .foregroundColor(.gray)
                        .frame(width: 250, height: 250)
                }
                
                HStack{
                    CustomBezier()
                        .stroke(.yellow, lineWidth: 10)
                        .frame(width: 200, height: 200)
                    
                    CustomBezier()
                        .foregroundColor(.yellow)
                    //                        .stroke(.yellow, lineWidth: 10)
                        .frame(width: 200, height: 200)
                    
                }
                
                HStack{
                    CustomBezier2()
                        .stroke(.orange, lineWidth: 10)
                        .frame(width: 200, height: 200)
                    
                    CustomBezier2()
                        .foregroundColor(.orange)
                    //                        .stroke(.orange, lineWidth: 10)
                        .frame(width: 200, height: 200)
                    
                }
            }
        }
    }
}

struct CustomShapeOther_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapeOther()
    }
}
