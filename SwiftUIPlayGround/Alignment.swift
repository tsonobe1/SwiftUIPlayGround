//
//  Alignment.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/25.
//

import SwiftUI

struct Alignment: View {
    var body: some View {
        ScrollView{
            //MARK: Alignmentはコンテナ、テキスト文、frameそれぞれで設定できる
            
            //MARK: コンテナで指定
            VStack(alignment: .trailing){
                Text("TEST TEST TEST")
                    .border(.green)
                Text("TEST \nTEST TEST TEST")
                    .border(.green)
                Text("TEST TEST")
                    .border(.green)
                Text("TEST TEST TEST")
                    .border(.green)
                Text("TEST")
                    .border(.green)
                Text("TEST TEST")
                    .border(.green)
                Text("TEST")
                    .border(.green)
            }
            .frame(width: 200, height: 200)
            .border(.red)
            
            //MARK: テキスト文で指定
            VStack(alignment: .trailing){
                Text("TEST TEST TEST")
                    .border(.green)
                Text("TEST \nTEST TEST TEST")
                    .multilineTextAlignment(.trailing)
                    .border(.green)
                Text("TEST TEST")
                    .border(.green)
                Text("TEST TEST TEST")
                    .border(.green)
                Text("TEST")
                    .border(.green)
                Text("TEST TEST")
                    .border(.green)
                Text("TEST")
                    .border(.green)
            }
            .frame(width: 200, height: 200)
            .border(.red)
            
            
            //MARK: frameで指定
            VStack(alignment: .trailing){
                Text("TEST TEST TEST")
                    .border(.green)
                Text("TEST \nTEST TEST TEST")
                    .multilineTextAlignment(.trailing)
                    .border(.green)
                Text("TEST TEST")
                    .border(.green)
                Text("TEST TEST TEST")
                    .border(.green)
                Text("TEST")
                    .border(.green)
                Text("TEST TEST")
                    .border(.green)
                Text("TEST")
                    .border(.green)
            }
            .frame(width: 200, height: 200, alignment: .leading)
            .border(.red)
        
        }
    }
}

struct Alignment_Previews: PreviewProvider {
    static var previews: some View {
        Alignment()
    }
}
