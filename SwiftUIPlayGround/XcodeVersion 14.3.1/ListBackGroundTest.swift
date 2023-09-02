//
//  ListBackGroundTest.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2023/01/27.
//

import SwiftUI

struct ListBackGroundTest: View {
    @State private var users = ["user1", "user2", "user3","user4","user5"]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.purple)
                .overlay(
                    List {
                        ForEach(users, id: \.self) { user in
                            Text(user)
                                .listRowInsets(EdgeInsets())
                                .listRowBackground(Color.yellow)
                                

                        }
                        .onMove(perform: move)
                    }
                        .offset(x: 50)
                        .frame(width: 200)
                        .listStyle(.plain)
                        .environment(\.editMode, .constant(EditMode.active))
                )

        }
        .padding()
    }
    
    func move(from source: IndexSet, to destination: Int) {
        users.move(fromOffsets: source, toOffset: destination)
    }
}
