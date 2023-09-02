//
//  WeekbarByOpenAI.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/12/01.
//

import SwiftUI


struct HorizontalWeeklyCalendar: View {
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            HStack(alignment: .center, spacing: 0) {
                ForEach(0..<7) { day in
                    Text("\(day)")
                        .frame(width: 40, height: 40)
                        .background(Color.yellow)
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal, 10)
            Spacer()
        }
    }
}

struct HorizontalWeeklyCalendar_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalWeeklyCalendar()
    }
}
