//
//  PrintDebug.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/10/10.
//

import SwiftUI

struct PrintDebug: View {
    @State private var height1: CGFloat = 100
    var body: some View {
        VStack {
            Button("Change Height") {
                if height1 == 100 {
                    height1 = 200
                } else {
                    height1 = 100
                }
            }
            
            RoundedRectangle(cornerRadius: 10)
                .fill(.tertiary)
                .frame(width: 200, height: height1)
            let _ = Self._printChanges()

            RoundedRectangle(cornerRadius: 10)
                .fill(.teal)
                .frame(width: 200, height: 100)
            
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.brown)
                    .frame(width: 200, height: 100)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(.indigo)
                    .frame(width: 200, height: 100)
            }
            
            PrintDebug2(height2: $height1)
        }
    }
}

struct PrintDebug2: View {
    @Binding var height2: CGFloat
    
    var body: some View {
        Button("Change Height") {
            if height2 == 100 {
                height2 = 200
            } else {
                height2 = 100
            }
        }
        
        RoundedRectangle(cornerRadius: 10)
            .fill(.tertiary)
            .frame(width: 200, height: height2)
        let _ = Self._printChanges()
    }
}


struct PrintDebug_Previews: PreviewProvider {
    static var previews: some View {
        PrintDebug()
    }
}
