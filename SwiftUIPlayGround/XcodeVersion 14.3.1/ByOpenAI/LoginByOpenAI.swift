//
//  LoginByOpenAI.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/12/01.
//

import SwiftUI


struct LogInView: View {
    // ユーザー名
    @State var username = ""
    
    // パスワード
    @State var password = ""
    
    // ログインボタン押下時の動作
    func logIn() {
        // ログイン処理
    }
    
    var body: some View {
        VStack {
            Text("Log In")
                .font(.largeTitle)
            
            // ユーザー名を入力
            TextField("Username", text: $username)
                .padding()
                .background(Color.white)
                .cornerRadius(5)
            
            // パスワードを入力
            SecureField("Password", text: $password)
                .padding()
                .background(Color.white)
                .cornerRadius(5)
            
            // ログインボタン
            Button(action: logIn) {
                Text("Log In")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
        }
    }
}

struct LoginByOpenAI_Previews: PreviewProvider {
    static var previews: some View {
        LogInView(username: "123", password: "123")
    }
}
