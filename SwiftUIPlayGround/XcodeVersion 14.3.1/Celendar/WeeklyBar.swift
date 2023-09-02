//
//  WeeklyBar.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/10/19.
//

import SwiftUI

struct WeeklyBar: View {
    let week:[String] = ["San","Mon","Tue","Wed","Thu","Fri","Sat"]

    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
            ForEach(week, id: \.self) { i in
                Text(i)
            }
            ForEach((16...22), id: \.self) { index in
                Text("\(index)")
                    .frame(width: 50, height: 50)
            }
        }
    }
}

struct WeeklyBar_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyBar()
    }
}
