//
//  CustumShape.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/18.
//

import SwiftUI


// MARK: Shape Typeに準拠したStructでPath関数を使って図形を描く
struct CustomShapeLine: Shape{
    // Shapeに準拠したstructの中でpath関数を使うことで、parameter経由で、長方形の位置とサイズを保持するCGRectを受け取れる
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // move -> 始点
        path.move(to: CGPoint(x: 0, y: 0))
        
        // moveで指定した位置、もしくは直前の位置から起算して、x, yに指定いた位置まで移動
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0))
        return path
    }
}



struct CustumShape: View {
    // MARK: Path型のクロージャでaddlineを使って図形を描く
    let line1 = Path { path in
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 100))
        path.addLine(to: CGPoint(x: 100, y: 100))
        path.addLine(to: CGPoint(x: 100, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0))
    }
    
    
    // MARK: Path型のクロージャでaddlinesを使って図形を描く
    let line2 = Path { path in
        // addlines -> 指定した配列の複数要素(以下のCDPoint)を結ぶように描く
        path.addLines([CGPoint(x: 0, y: 0),
                       CGPoint(x: 0, y: 100),
                       CGPoint(x: 100, y: 100),
                       CGPoint(x: 100, y: 0),
                       CGPoint(x: 0, y: 0)])
    }
    
    var body: some View {
        HStack{
            CustomShapeLine()
                .stroke(Color.green, lineWidth: 5)
                .frame(width: 100, height: 100)
                .overlay(Text("CustomShape").font(.title))
            
            line1.stroke(Color.yellow, lineWidth: 5)
                .frame(width: 100, height: 100)
                .overlay(Text("Line 1").font(.title))
            
            line2.stroke(Color.red, lineWidth: 5)
                .frame(width: 100, height: 100)
                .overlay(Text("Line 1").font(.title))
        }
    }
}


struct CustumShape_Previews: PreviewProvider {
    static var previews: some View {
        CustumShape()
    }
}
