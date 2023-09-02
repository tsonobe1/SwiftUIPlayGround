//
//  scroll5.swift
//  imonit
//
//  Created by 薗部拓人 on 2023/08/24.
//

import SwiftUI

struct scroll5: View {
    @State var selectedDate: Date = Date()
    @State var AxisY = 0.0
    
    @State var timelineHeihgt: Double = 80.0
    @State var magnifyBy: Double = 1.0
    
    let currentDate = Date()
    @State var dateList: [Date] = []
    @State private var isLoading = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(DateFormatter.monthFormatter.string(from: selectedDate))
                .font(.title)
                .bold()
            Group{
                VStack(spacing:0){
                    VStack(spacing: 0){
                        Text(" ")
                            .font(Font(UIFont.monospacedDigitSystemFont(ofSize: 11.0, weight: .regular)))
                        Text(" ")
                            .bold()
                            .bold()
                            .font(Font(UIFont.monospacedDigitSystemFont(ofSize: 14.0, weight: .regular)))
                    }
                    .foregroundStyle(.clear)
                    .font(Font(UIFont.monospacedDigitSystemFont(ofSize: 11.0, weight: .regular)))
                    .containerRelativeFrame(.horizontal, count: 10, span: 1, spacing: 0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .overlay(alignment: .trailing){
                    // Date Label
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 0){
                            // MARK: 📆 Scrollable Multi-Day Schedule
                            ForEach(dateList, id: \.self.hashValue) { day in
                                VStack(spacing: 0){
                                    Text("Sun")
                                        .font(Font(UIFont.monospacedDigitSystemFont(ofSize: 11.0, weight: .regular)))
                                    Text(getFormattedDay(day))                                        .bold()
                                        .font(Font(UIFont.monospacedDigitSystemFont(ofSize: 14.0, weight: .regular)))
                                }
                                .containerRelativeFrame(.horizontal, count: 7, span: 3, spacing: 0)
                            }
                        }
                        .offset(x: AxisY)
                    }
                    .scrollDisabled(true)
                    .containerRelativeFrame(.horizontal, count: 10, span: 9, spacing: 0)
                }
            }
            
            ScrollView{
                VStack(spacing: 0){
                    // Loop through each hour to create hourly labels
                    ForEach(0..<24, id: \.self) { hour in
                        // Hours xx:xx
                        Text("\(String(format: "%02d", hour)):00")
                            .font(Font(UIFont.monospacedDigitSystemFont(ofSize: 10.0, weight: .regular)))
                            .containerRelativeFrame(.horizontal, count: 10, span: 1, spacing: 0)
                            .frame(height: timelineHeihgt * magnifyBy)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .offset(y: -(timelineHeihgt * magnifyBy / 2.3))
                
                .overlay(alignment: .trailing){
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 0){
                            // MARK: 📆 Scrollable Multi-Day Schedule
                            ForEach(dateList, id: \.self) { day in
                                VStack(spacing: 0){
                                    // MARK: 📆 Daily Schedule
                                    ForEach(0..<24, id: \.self) { _ in
                                        HStack(spacing: 0){
                                            RoundedRectangle(cornerRadius: 10) // Vercical Divider
                                                .frame(width: 0.8)
                                                .foregroundStyle(.primary)
                                                .opacity(0.3)
                                                .offset(y: (timelineHeihgt * magnifyBy / 2))
                                            RoundedRectangle(cornerRadius: 10) // Horizontal Divider
                                                .frame(height: timelineHeihgt * magnifyBy)
                                                .foregroundStyle(.clear)
                                                .overlay{
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .frame(height: 0.8)
                                                        .foregroundColor(.primary)
                                                        .opacity(0.3)
                                                }
                                        }
                                    }
                                }
                                .onAppear{
                                    handleItemAppearance(item: day)
                                }
                                .containerRelativeFrame(.horizontal, count: 7, span: 3, spacing: 0)
                                .offset(y: -(timelineHeihgt * magnifyBy / 2.3))
                                .onAppear{
                                    selectedDate = day
                                }
//                                .overlay(GeometryReader { proxy -> Color in
//                                    DispatchQueue.main.async {
//                                        selectedDate = day
//                                    }
//                                    return Color.clear
//                                })
                                
                            }
                        }
                        .scrollTargetLayout()
                        .overlay(
                            GeometryReader { proxy in
                                Color.clear.preference(key: ScrollOffsetKey.self,
                                                       value: proxy.frame(in: .named("ScrollView")).origin.x)
                            }
                        )

                    }
                    .coordinateSpace(name: "ScrollView")
                    .onAppear {
                        // 今日を中心に前後7日（合計15日）の日付リストを作成
                        for i in -5...5 {
                            if let newDate = Calendar.current.date(byAdding: .day, value: i, to: currentDate) {
                                dateList.append(newDate)
                            }
                        }
                    }
                    // Modifier to horizontal scroll Daily Schedule one by one
                    .defaultScrollAnchor(.top)
                    .scrollTargetBehavior(.viewAligned)
                    .containerRelativeFrame(.horizontal, count: 10, span: 9, spacing: 0)
                }
                .onPreferenceChange(ScrollOffsetKey.self) { offset in
                    // ここでoffsetをもう一つのスクロールビューに適用する
                    self.AxisY = offset
                }

            }
        }
    }
    
    private func handleItemAppearance(item: Date) {
        switch item {
        case dateList.last:
            appendNewItems()
        case dateList.first:
            prependNewItems()
        default:
            print("do not")
        }
        
//        if item == dateList.last {
//            appendNewItems()
//        } else if item == dateList.first {
//            prependNewItems()
//        }
        print(dateList.count)
    }
    
    private func appendNewItems() {
        guard !isLoading else { return }
        isLoading = true
        
        // dateList の最後の日付から1日後の日付を作成
        if let lastDate = dateList.last,
           let newDate = Calendar.current.date(byAdding: .day, value: 1, to: lastDate) {
            dateList.append(newDate)
//            print(dateList)
        }
        
        isLoading = false
    }
    
    private func prependNewItems() {
        guard !isLoading else { return }
        isLoading = true
        
        // dateList の最初の日付から1日前の日付を作成
        if let firstDate = dateList.first,
           let newDate = Calendar.current.date(byAdding: .day, value: -1, to: firstDate) {
            dateList.insert(newDate, at: 0)
//            print(dateList)
        }
        
        isLoading = false
    }
    
    
    func getFormattedDay(_ date: Date) -> String {
        return DateFormatter.dayFormatter.string(from: date)
    }

}

#Preview {
    scroll5()
}



struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
