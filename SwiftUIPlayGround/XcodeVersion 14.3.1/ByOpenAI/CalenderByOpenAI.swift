//
//  CalenderByOpenAI.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/12/01.
//

import SwiftUI

//SwiftUIでWeeklyカレンダーをつくってください

//import SwiftUI

struct WeeklyCalendarByOpenAI: View {
    let today = Date()
    let calendar = Calendar.current
    let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    var body: some View {
        VStack {
            HStack {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.system(size:20))
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .padding(.vertical, 8)
                }
            }
            .padding(.vertical, 8)
            .background(Color.gray)
            
            Divider()
            
            // Calculate the start of the week
            let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today))!
            
            // Get a list of dates for the next 7 days
//            let days = (0..<7).map { day in
//                calendar.date(byAdding: .day, value: day, to: startOfWeek)!
//            }
            // Create a view for each day
//            ForEach(days, id: \.self) { day in
//                Text("\(calendar.component(.day, from: day))")
//                    .frame(minWidth: 0, maxWidth: .infinity)
//                    .font(.system(size:20))
//                    .padding(.vertical, 8)
//            }
        }
    }
}

struct WeeklyCalendar_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyCalendarByOpenAI()
    }
}
