//
//  CustomDrag.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/19.
//

import SwiftUI

struct CustomDrag: View {
    @State var isDragging = false
    @State var position: CGSize = CGSize(width: 200, height: 300)


    
    var drag: some Gesture{
        
        DragGesture(minimumDistance: 50, coordinateSpace: .local)
            .onChanged { value in
                self.isDragging = true
                self.position = CGSize(width: value.startLocation.x +  value.translation.width,
                                       height: value.startLocation.y +  value.translation.height)
            }
            .onEnded{ value in
                self.isDragging = false
                self.position = CGSize(width: value.startLocation.x +  value.translation.width,
                                       height: value.startLocation.y +  value.translation.height)
            }
    }
    
    var body: some View {
        VStack{
        Text("👍").font(.system(size: 100))
            Text(isDragging ? "Move" : "Stop").font(.title).bold()
        }
            .frame(width: 100, height: 100, alignment: .center)
            .position(x: position.width, y: position.height)
            .gesture(drag)
    }
}

struct CustomDrag_Previews: PreviewProvider {
    static var previews: some View {
        CustomDrag()
    }
}
