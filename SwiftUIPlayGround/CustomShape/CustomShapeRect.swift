//
//  CustomShapeRect.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/18.
//

import SwiftUI


struct CustomShapeRect1: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRect(CGRect(x: 0, y: 0, width: rect.width, height: rect.height))
        return path
    }
}

struct CustomShapeRect2: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRoundedRect(in: CGRect(x: 0, y: 0, width: rect.width, height: rect.height), cornerSize: CGSize(width: 25, height: 25))
        return path
    }
}

struct DynamicPositionRecr: Shape{
    // 起点
    @State var firstX = 100 // 😜
    @State var firstY = 100 // 🎉
    // 2点目
    @State var secondX = 200 // 🧴
    @State var secondY = 100 // 🎉
    // 3点目
    @State var thirdX = 200 // 🧴
    @State var thirdY = 200 // 💛
    // 4点目
    @State var forthX = 100 // 😜
    @State var forthY = 200 // 💛
    
    
    @State var lead = 100 // 😜
    @State var top = 100 // 🎉
    @State var trail = 200 // 🧴
    @State var bottom = 200 // 💛
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // move -> 始点
        path.move(to: CGPoint(x: firstX, y: firstY))
        
        // moveで指定した位置、もしくは直前の位置から起算して、x, yに指定いた位置まで移動
        path.addLine(to: CGPoint(x: secondX, y: secondY))
        path.addLine(to: CGPoint(x: thirdX, y: thirdY))
        path.addLine(to: CGPoint(x: forthX, y: forthY))
        path.addLine(to: CGPoint(x: firstX, y: firstY))
        return path
    }
}


struct DynamicPositionRect2: Shape{
//    // 起点
//    @State var firstX = 100 // 😜
//    @State var firstY = 100 // 🎉
//    // 2点目
//    @State var secondX = 200 // 🧴
//    @State var secondY = 100 // 🎉
//    // 3点目
//    @State var thirdX = 200 // 🧴
//    @State var thirdY = 200 // 💛
//    // 4点目
//    @State var forthX = 100 // 😜
//    @State var forthY = 200 // 💛
//
    
    @State var lead = 100 // 😜
    @State var top = 100 // 🎉
    @State var trail = 300 // 🧴
    @State var bottom = 150 // 💛
    
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


struct CustomShapeRect: View {
    var body: some View {
        VStack{
        CustomShapeRect1()
            .rotation(.degrees(45))
            .stroke(.cyan, lineWidth: 10)
            .frame(width: 100, height: 100)
        
        CustomShapeRect2()
            .rotation(.degrees(30))
            .stroke(.teal, lineWidth: 10)
            .frame(width: 100, height: 100)
        }
        DynamicPositionRecr()
        DynamicPositionRect2()
    }
}

struct CustomShapeRect_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapeRect()
    }
}
