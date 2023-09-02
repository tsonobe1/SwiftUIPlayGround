//
//  scroll4.swift
//  imonit
//
//  Created by 薗部拓人 on 2023/08/23.
//

import SwiftUI

struct scroll4: View {
    @State var x = true
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 0){
                ForEach(1...24, id: \.self) { _ in
                    Rectangle()
                        .frame(height: 40)
                        .foregroundStyle(.clear)
                        .overlay{
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(.red)
                        }
                        .onTapGesture {
                            x.toggle()
                        }
                }
            }

            .overlay(alignment: .trailing){
                VStack(spacing: 0){
                    ForEach(1...24, id: \.self) { _ in
                        Rectangle()
                            .frame(height: 40)
                            .foregroundStyle(.clear)
                            .overlay{
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundStyle(.green)
                            }
                            .overlay{
                                Text("\(x == true ? "1" : "2")")
                            }
                            .onTapGesture {
                                x.toggle()
                            }
                    }
                }
                .containerRelativeFrame(.horizontal, count: 10, span: 9, spacing: 0)

            }
        }
//        .containerRelativeFrame(.horizontal, count: 10, span: 10, spacing: 0)

        
    }
}

#Preview {
    scroll4()
}


