//
//  CardDadeoutGradient.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/09/23.
//

import SwiftUI

struct CardGradient: View {
    var tx = "TEST"
    
    var body: some View {
        VStack {
            ForEach(1..<20){ _ in
                Text(tx)
            }
        }
        .frame(width: 350 ,height: 200, alignment: .top)
        .background(.white)
        .cornerRadius(8)
        .shadow(color: .gray.opacity(0.7), radius: 5)
//        .padding()

    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
            CardGradient()
    }
}
