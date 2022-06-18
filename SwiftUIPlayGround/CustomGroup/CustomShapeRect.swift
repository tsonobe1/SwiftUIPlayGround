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
    }
}

struct CustomShapeRect_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapeRect()
    }
}
