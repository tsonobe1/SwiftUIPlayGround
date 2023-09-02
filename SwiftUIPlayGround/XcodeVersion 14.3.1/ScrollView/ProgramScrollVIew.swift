//
//  ProgramScrollVIew.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/09/13.
//

import SwiftUI

struct TestScrollBackView: View {
    @State private var stored: Int = 0
    @State private var current: [Int] = []
    
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                HStack {
                    Button("Store") {
                        // hard code is just for demo !!!
                        stored = current.sorted()[1] // 1st is out of screen by LazyVStack
                        print("!! stored \(stored)")
                    }
                    Button("Restore") {
                        proxy.scrollTo(stored, anchor: .top)
                        print("[x] restored \(stored)")
                    }
                }
                Divider()
                ScrollView {
                    LazyVStack {
                        ForEach(0..<1000, id: \.self) { obj in
                            Text("Item: \(obj)")
                                .onAppear {
                                    print(">> added \(obj)")
                                    current.append(obj)
                                }
                                .onDisappear {
//                                    print("$0: \($0)")
                                    current.removeAll { $0 == obj }
                                    print("<< removed \(obj)")
                                }
                                .id(obj)
                        }
                    }
                }
            }
        }
    }
}

struct ProgramScrollVIew_Previews: PreviewProvider {
    static var previews: some View {
        TestScrollBackView()
    }
}
