//
//  scroll7.swift
//  imonit
//
//  Created by 薗部拓人 on 2023/08/26.
//

import SwiftUI

#Preview {
    CalendarWeeklyViewY()
}


struct CalendarWeeklyViewY: View {
    
    var hourHeight: CGFloat = 100
    
    var headerHeight: CGFloat = 60
    
    @State private var offset = CGPoint.zero
    
    let currentDate = Date() // 現在の日付を取得
    @State var dateList: [Date] = []
    @State private var isLoading = false
    
    
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                // empty corner
                Color.clear.frame(height: headerHeight)
                ScrollView([.vertical]) {rowsHeader.offset(y: offset.y)}
                    .disabled(true)
                    .offset(y: -hourHeight/4)
                    .scrollIndicators(.hidden)
            }
            .containerRelativeFrame(.horizontal, count: 10, span: 1, spacing: 0)
            VStack(alignment: .leading, spacing: 0) {
                ScrollView([.horizontal]) {colsHeader.offset(x: offset.x)}
                    .disabled(true)
                table.coordinateSpace(name: "scroll")
            }
            .containerRelativeFrame(.horizontal, count: 10, span: 9, spacing: 0)
        }
        .onAppear {
            // 今日を中心に前後7日（合計15日）の日付リストを作成
            for i in -16...16 {
                if let newDate = Calendar.current.date(byAdding: .day, value: i, to: currentDate) {
                    dateList.append(newDate)
                }
            }
        }
    }
    
    var colsHeader: some View {
        HStack(alignment: .top, spacing: 0) {
            ForEach(dateList, id: \.self) { day in
                VStack{
                    Text(DateFormatter.monthFormatter.string(from: day))
                        .font(.caption)
                    Text(DateFormatter.dayFormatter.string(from: day))
                        .font(.title3)
                        .bold()
                }
                    .frame(height: headerHeight)
                    .containerRelativeFrame(.horizontal, count: 7, span: 2, spacing: 0)
                    .overlay(alignment: .topLeading){
                        Rectangle()
                            .frame(width: 1)
                            .opacity(0.3)
                    }
            }
        }
    }
    
    var rowsHeader: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(0...24, id: \.self) { hour in
                Color.clear
                    .frame(height: hourHeight)
                    .overlay(alignment: .center){
                        Text("\(String(format: "%02d", hour)):00")
                            .font(.caption2)
                            .offset(y: -hourHeight/4)
                            .opacity(0.8)
                    }
            }
        }
    }
    
    var table: some View {
        ScrollView([.vertical, .horizontal], showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(0...24, id: \.self) { hour in
                    LazyHStack(alignment: .top, spacing: 0) {
                        ForEach(dateList, id: \.self) { day in
                            // Cell
                            Group{
                                ZStack(alignment: .topLeading){
                                    Rectangle()
                                        .frame(height: 1)
                                    Rectangle()
                                        .frame(width: 1)
                                }
                                .opacity(0.3)
                            }
                            .frame(height: hourHeight)
                            .containerRelativeFrame(.horizontal, count: 7, span: 2, spacing: 0)
                            .id("\(hour)_\(day)")
                            .onAppear{
                                handleItemAppearance(item: day)
                            }
                        }
                    }
                    .scrollTargetLayout()
                    
                }
            }
            .background( GeometryReader { geo in
                Color.clear
                    .preference(key: ViewOffsetKey3.self, value: geo.frame(in: .named("scroll")).origin)
            })
            .onPreferenceChange(ViewOffsetKey3.self) { value in
                //                print("offset >> \(value)")
                offset = value
            }
        }
        .defaultScrollAnchor(.top)
        .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
        
    }
    
    private func handleItemAppearance(item: Date) {
        if item == dateList.last {
            appendNewItems()
        } else if item == dateList.first {
            prependNewItems()
        }
    }
    
    private func appendNewItems() {
        guard !isLoading else { return }
        isLoading = true
        
        // dateList の最後の日付から1日後の日付を作成
        if let lastDate = dateList.last,
           let newDate = Calendar.current.date(byAdding: .day, value: 1, to: lastDate) {
            dateList.append(newDate)
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
        }
        
        isLoading = false
    }
    
}

struct ViewOffsetKey3: PreferenceKey {
    typealias Value = CGPoint
    static var defaultValue = CGPoint.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value.x += nextValue().x
        value.y += nextValue().y
    }
}

