//
//  CustomModifire.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/26.
//

import SwiftUI
/*  同じmodifireの組み合わせを複数のViewに対して使いたい場合、何度もmodifireを書くのは非効率
 modifireの組み合わせをグループ化して、使い回す方法がある
 　　　①Viewmodifireプロトコルに準拠したstructを定義して、View().modifire(struct)で使う
 　　　②extensionでmodifireを拡張する
 */


// MARK: ①ViewModifireプロトコルをつかって、modifireをカスタマイズする
// ViewModifireプロトコルに準拠したstructを作り、body(content:)の引数であるcontentに対して値を適用して返却するよう
// それを、反映したいViewに対して.modifire()で使う

// ViewModifierではViewプロトコルで定義されたモディファイアのみ指定可能
// bold italicなどはViewプロトコルで定義されていないため、使用不可能

struct CustomTextModifireA: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
        // .boldは使用不可
        //  .bold()
            .foregroundColor(.orange)
            .font(.headline)
            .border(.red, width: 5)
            .cornerRadius(20)
            .shadow(radius: 5)
    }
}

struct CustomTextModifireB: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(.blue)
            .font(.headline)
            .border(.green, width: 5)
            .cornerRadius(20)
            .shadow(radius: 5)
    }
}

struct CustomModifire: View {
    var body: some View {
        VStack{
            // Custom Modifireを使用
            VStack{
                Text("Custom Modifireを使用")
                    .bold()
                Text("Text A")
                    .modifier(CustomTextModifireA())
                Text("Text B")
                    .modifier(CustomTextModifireB())
                Text("Text A")
                    .modifier(CustomTextModifireA())
                Text("Text B")
                    .modifier(CustomTextModifireB())
            }
            Divider()
            
            VStack{
                Text("Textに独自のメソッド(modifire)をextensionで拡張")
                    .bold()
                Text("Text C")
                    .CustomViewModifire()
                Image(systemName: "person.badge.key.fill")
                    .CustomImageModifire()
            }
        }
    }
}



// MARK: ②extensionで、Textに新しいmodifireを追加
extension Text {
    func CustomViewModifire() -> some View {
        // self = 拡張されるview object自身
        self
            .font(.title)
            .bold()
            .underline()
            .italic()
            .foregroundColor(Color.green)
    }
}

// MARK: ②extensionで、Imageに新しいmodifireを追加
extension Image {
    func CustomImageModifire() -> some View {
        self
            .offset(x: -2, y: 0)
            .padding()
            .background(.yellow.opacity(0.5))
            .foregroundColor(.orange)
            .font(.system(size: 50))
            .cornerRadius(10)
            .shadow(color: .gray, radius: 0, x: 10, y: 10)
        
    }
}

struct CustomModifire_Previews: PreviewProvider {
    static var previews: some View {
        CustomModifire()
    }
}
