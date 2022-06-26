////
////  CustomPreferenceKey.swift
////  SwiftUIPlayGround
////
////  Created by 薗部拓人 on 2022/06/26.
////
//
//import SwiftUI
//
//struct MyPreference: PreferenceKey{
//    // Value : 下位Viewと上位Viewで共有するデータの型
//    typealias Value = String
//    // defaultValue : 初期値
//    static var defaultValue: String = "Default"
//    // reduce : 複数の下位Viewでpreferenceを使ったときの、それらの値の処理方法
//    static func reduce(value: inout Value, nextValue: () -> String) {
//        let next = nextValue()
//                print("reduce() value: \(value), nextValue: \(next)")
//                value = next
//    }
//}
//
//struct CustomPreferenceKey: View {
//    @State private var customKey = ""
//    var body: some View {
//        Text("Hello, World!")
//            .preference(key: MyPreference.self, value: "New!")
//            .onPreferenceChange(MyPreference.self){ (value: MyPreference.Value) in
//                customKey = value
//                print(customKey)
//            }
//    }
//}
//
//
//struct ParentContentView: View {
//    var body: some View {
//        CustomPreferenceKey.preference(key: CustomPreferenceKey.self, value: "TEST")
//    }
//}
//
//struct ParentContentView_preview: PreviewProvider {
//    static var previews: some View {
//        ParentContentView()
//    }
//}
//
//
