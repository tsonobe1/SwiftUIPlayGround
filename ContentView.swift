//
//  ContentView.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationStack {
            List{
                NavigationLink("ContentViewXcodeVersion14_3_1"){
                    ContentViewXcodeVersion14_3_1()
                }
                NavigationLink("NoteBookList"){
                    NoteBookList()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
