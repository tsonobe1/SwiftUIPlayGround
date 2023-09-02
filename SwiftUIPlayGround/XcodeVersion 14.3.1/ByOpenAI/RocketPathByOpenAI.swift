//
//  RocketPathByOpenAI.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/12/01.
//

//SwiftUIでロケットを描いてみる

import SwiftUI

struct Rocket: View {
  var body: some View {
    VStack {
        Body1()
        .offset(x: 0, y: -50)
      Flame(length: 30)
        .offset(x: 0, y: -15)
    }
  }
}

struct Body1: View {
  var body: some View {
    Rectangle()
      .fill(Color.gray)
      .frame(width: 40, height: 150)
      .overlay(
        Rectangle()
          .fill(Color.white)
          .frame(width: 30, height: 130)
    )
    .cornerRadius(20)
  }
}

struct Flame: View {
  let length: CGFloat
  
  var body: some View {
    Path { path in
      path.move(to: CGPoint(x: 0, y: 0))
      path.addLine(to: CGPoint(x: 0, y: length))
      path.addLine(to: CGPoint(x: -30, y: length + 20))
      path.addLine(to: CGPoint(x: -20, y: length + 40))
      path.addLine(to: CGPoint(x: -10, y: length + 20))
      path.addLine(to: CGPoint(x: 10, y: length + 20))
      path.addLine(to: CGPoint(x: 20, y: length + 40))
      path.addLine(to: CGPoint(x: 30, y: length + 20))
      path.addLine(to: CGPoint(x: 0, y: length))
      path.closeSubpath()
    }
    .fill(Color.yellow)
  }
}

struct Roc: View {
  var body: some View {
    Rocket()
  }
}

struct Roc_Previews: PreviewProvider {
  static var previews: some View {
      Roc()
  }
}


