//
//  Scroll.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/09/13.
//

import SwiftUI

struct ContentVie2w: View {
    @State private var scrollTarget: Int?

    var body: some View {
        NavigationView {
            VStack {
                ScrollViewReader { (proxy: ScrollViewProxy) in

                ScrollView {
                        VStack {
                            ForEach(0..<100) { i in
                                Text("Row \(i)")
                                    .frame(height: 40)
                                    .id(i) // Uniquely identify each row in the scrollview by its index
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        // Scroll to the desired row when the @State variable changes
                        .onChange(of: scrollTarget) { target in
                        if let target = target {
                            scrollTarget = nil

                            withAnimation {
                                proxy.scrollTo(target, anchor: .center)
                            }
                        }
                    }
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<10) { i in
                            Button("Row \(i * 10)") {
                                // Store the desired scroll index
                                scrollTarget = i * 10
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Scroll Example")
        }
    }
}

struct Scroll_Previews: PreviewProvider {
    static var previews: some View {
        ContentVie2w()
    }
}
