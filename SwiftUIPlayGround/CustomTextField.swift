//
//  CustomTextField.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/30.
//

import SwiftUI

struct CustomTextField: View {
    @State private var input: String = ""
    @State private var on: Bool = false
    @State private var enter: Bool = false
    
    @State private var inputNumber: Int = 0
    static let myFormat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        VStack(spacing: 20){
            VStack{
                // MARK: onEditingChange クロージャと onCommitクロージャ
                TextField(".roundedBorder", text: $input, onEditingChanged: { (changed) in
                    // onEditingChange : テキスト入力状態が変化した
                    on = changed
                    print(changed)
                })
                {
                    // onCommit : 入力が確定した
                    enter = true
                    print("入力が確定しました　→ \(input)")
                }
                .textFieldStyle(.roundedBorder)
                
                Text(on ? "入力中！": "入力していない！")
                Text(enter ? "Enterで入力確定！" : "入力未確定")
            }
            .padding()
            .background(Color.yellow)
            .compositingGroup()        // Viewの要素をグループ化
            .shadow(color: .gray, radius: 3, x: 10, y: 10)
            
            // MARK: Format
            VStack{
                TextField("RoundedBorderTextFieldStyle", value: $inputNumber, formatter:CustomTextField.myFormat)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("\(inputNumber)")
            }
            .padding()
            .background(Color.blue)
            .compositingGroup()        // Viewの要素をグループ化
            .shadow(color: .gray, radius: 3, x: 10, y: 10)
                     
                     
                     
                     
                     
            // MARK: SecureField
            SecureField("PlainTextFieldStyle", text: $input)
                .textFieldStyle(PlainTextFieldStyle())
                .padding()
                .background(Color.green)
                .compositingGroup()        // Viewの要素をグループ化
                .shadow(color: .gray, radius: 3, x: 10, y: 10)
            
            TextField("DefaultTextFieldStyle", text: $input)
                .textFieldStyle(DefaultTextFieldStyle())
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField()
    }
}
