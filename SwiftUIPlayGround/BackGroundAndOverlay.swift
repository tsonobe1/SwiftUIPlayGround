//
//  BackGroundAndOverlay.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/24.
//

import SwiftUI

struct BackGroundAndOverlay: View {
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                Circle()
                    .fill(.green)
                    .frame(width: 200, height: 200)
                // background = subViewが後ろに回る
                    .background(SubView())
                    .overlay(Text("BackGround"))
                
                Circle()
                    .fill(.green)
                    .frame(width: 200, height: 200)
                    .overlay(
                        ZStack{SubView()
                            Text("overlay")}
                    )
                // overlay = subViewが全面にくる
                
                Circle()
                    .fill(.green).opacity(0.5)
                    .frame(width: 200, height: 200)
                // background = subViewが後ろに回る
                    .background(Triangle())
                    .overlay(Text("BackGround"))
                
                
                Circle()
                    .fill(.green)
                    .frame(width: 200, height: 200)
                // overlay = subViewが後ろに回る
                    .overlay(
                        ZStack{
                            Triangle()
                            Text("overlay")})
                
                
                VStack{
                    Text("Hello")
                        .foregroundColor(.red)
                        .font(.title)
                }
                .frame(maxWidth: .infinity, maxHeight: 200)
                .background(Gradient())
            }
        }
    }
}
func Gradient() -> some View{
    return Rectangle()
        .fill(
            LinearGradient(
                gradient: .init(colors: [.yellow, .green]),
                startPoint: .leading,
                endPoint: .trailing
            )
        )
}


struct SubView: View{
    var body: some View{
        RoundedRectangle(cornerRadius: 40, style: .continuous)
            .fill(.yellow.opacity(0.6))
    }
}

func Triangle()-> some View{
    return GeometryReader{ proxy in
        Path { path in
            path.move(to: CGPoint(x: proxy.size.width / 2, y: 0))
            path.addLine(to: CGPoint(x: 0, y: proxy.size.height))
            path.addLine(to: CGPoint(x: proxy.size.width, y: proxy.size.height))
        }.fill(.indigo)
    }
}


struct BackGroundAndOverlay_Previews: PreviewProvider {
    static var previews: some View {
        BackGroundAndOverlay()
    }
}
