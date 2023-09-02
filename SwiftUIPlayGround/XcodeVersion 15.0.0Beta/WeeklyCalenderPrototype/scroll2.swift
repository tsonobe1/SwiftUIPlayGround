//
//  scroll2.swift
//  imonit
//
//  Created by 薗部拓人 on 2023/08/23.
//

import SwiftUI

struct scroll2: View {
    var items = [1,2,3,4,5,6,7,8,9,10]
    
    var body: some View {
        VStack(spacing: 0){
            Text("20")
            
            ScrollView(.horizontal) {
                ScrollView(.vertical) {
                    HStack(spacing: 0){
                        //MARK: xx:xx
                        VStack(spacing: 0){
                            ForEach(1...24, id: \.self) { hour in
                                Rectangle()
                                    .frame(height: 40)
                                    .foregroundStyle(.clear)
                                    .overlay{
                                        Rectangle()
                                            .frame(height: 1)
                                            .foregroundStyle(.red)
                                    }
                            }
                        }
                        .containerRelativeFrame(.horizontal, count: 10, span: 1, spacing: 0)
                        
                        //MARK: Iteration Contents 🔄
                        ScrollView(.horizontal){
                            LazyHStack(spacing: 0){
                                ForEach(items, id: \.self){ i in
                                    HStack(spacing: 0){
                                        // vertical line
                                        Rectangle()
                                            .frame(width: 1)
                                        
                                        //MARK: ------ * 24
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
                                                //                            .containerRelativeFrame(.horizontal, count: 10, span: 10, spacing: 0)
                                            }
                                        }
                                    }
                                    .containerRelativeFrame(.horizontal, count: 10, span: 5, spacing: 0)
                                    
                                    
                                    
                                }
                            }
                            
                        }
                        .containerRelativeFrame(.horizontal, count: 10, span: 9, spacing: 0)
                    }
                }
            }
            
        }
    }
}

#Preview {
    scroll2()
}
