//
//  scroll8.swift
//  imonit
//
//  Created by 薗部拓人 on 2023/08/26.
//

import SwiftUI

struct scroll8: View {
    var body: some View {
        VStack{
            Rectangle()
                .frame(width: 200, height: 40)
                .foregroundStyle(.red)
            
            Rectangle()
                .frame(width: 200, height: 40)
                .foregroundColor(.blue)
                .offset(y: -30)
        }
    }
}

#Preview {
    scroll8()
}
