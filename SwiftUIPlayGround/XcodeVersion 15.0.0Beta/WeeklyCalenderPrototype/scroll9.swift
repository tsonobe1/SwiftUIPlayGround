//
//  scroll9.swift
//  imonit
//
//  Created by 薗部拓人 on 2023/08/26.
//

import SwiftUI



#Preview {
    scroll9()
}

struct GalleryScrollTargetBehavior: ScrollTargetBehavior {
    func updateTarget(_ target: inout ScrollTarget, context: TargetContext) {
        if target.rect.minX < (context.containerSize.width / 3.0),
           context.velocity.dy < 0.0
        {
            target.rect.origin.x = 0.0
        }
    }
}

struct CustomScrollTargetBehavior: ScrollTargetBehavior {
  func updateTarget(_ target: inout ScrollTarget, context: TargetContext) {
    if target.rect.origin.x > 0 {
      target.rect.origin.x -= 100
    } else {
      target.rect.origin.x += 100
    }
  }
}
extension ScrollTargetBehavior where Self == CustomScrollTargetBehavior {
    static var custom: CustomScrollTargetBehavior { .init() }
}

struct scroll9: View {
    var body: some View {
        //Implementation
        ScrollView(.horizontal) {
          LazyHStack {
            ForEach(0..<100) { index in
              Text("\(index)")
            }
          }
          .scrollTargetLayout()
        }
        .scrollTargetBehavior(CustomScrollTargetBehavior())
    }
}
