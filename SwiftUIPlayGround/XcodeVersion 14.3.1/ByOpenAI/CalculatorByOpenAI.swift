//SwiftUIで電卓を作ってください

import SwiftUI

struct CalcByOpenAI: View {
    @State private var number1: String = "0"
    @State private var number2: String = "0"
    @State private var result: String = "0"
    @State private var isOperation: Bool = false
    @State private var op: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(result)
                    .font(.system(size: 50))
            }
            HStack {
                Spacer()
                VStack(spacing: 10) {
                    Button(action: {
                        self.addNumber(num: 1)
                    }) {
                        Text("1")
                            .font(.system(size: 30))
                    }
                    Button(action: {
                        self.addNumber(num: 2)
                    }) {
                        Text("2")
                            .font(.system(size: 30))
                    }
                    Button(action: {
                        self.addNumber(num: 3)
                    }) {
                        Text("3")
                            .font(.system(size: 30))
                    }
                    Button(action: {
                        self.op = "+"
                        self.isOperation = true
                    }) {
                        Text("+")
                            .font(.system(size: 30))
                    }
                }
                Spacer()
                VStack(spacing: 10) {
                    Button(action: {
                        self.addNumber(num: 4)
                    }) {
                        Text("4")
                            .font(.system(size: 30))
                    }
                    Button(action: {
                        self.addNumber(num: 5)
                    }) {
                        Text("5")
                            .font(.system(size: 30))
                    }
                    Button(action: {
                        self.addNumber(num: 6)
                    }) {
                        Text("6")
                            .font(.system(size: 30))
                    }
                    Button(action: {
                        self.op = "-"
                        self.isOperation = true
                    }) {
                        Text("-")
                            .font(.system(size: 30))
                    }
                }
                Spacer()
                VStack(spacing: 10) {
                    Button(action: {
                        self.addNumber(num: 7)
                    }) {
                        Text("7")
                            .font(.system(size: 30))
                    }
                    Button(action: {
                        self.addNumber(num: 8)
                    }) {
                        Text("8")
                            .font(.system(size: 30))
                    }
                    Button(action: {
                        self.addNumber(num: 9)
                    }) {
                        Text("9")
                            .font(.system(size: 30))
                    }
                    Button(action: {
                        self.op = "*"
                        self.isOperation = true
                    }) {
                        Text("*")
                            .font(.system(size: 30))
                    }
                }
                Spacer()
                VStack(spacing: 10) {
                    Button(action: {
                        self.addNumber(num: 0)
                    }) {
                        Text("0")
                            .font(.system(size: 30))
                    }
                    Button(action: {
                        self.calc()
                    }) {
                        Text("=")
                            .font(.system(size: 30))
                    }
                    Button(action: {
                        self.op = "/"
                        self.isOperation = true
                    }) {
                        Text("/")
                            .font(.system(size: 30))
                    }
                }
                Spacer()
            }
        }
    }
    
    func addNumber(num: Int) {
        if isOperation {
            number2 += String(num)
            result = String(num)
        } else {
            number1 += String(num)
            result = String(num)
        }
    }
    
    func calc() {
        if op == "+" {
            let n1 = Double(number1) ?? 0
            let n2 = Double(number2) ?? 0
            let res = n1 + n2
            result = String(res)
        } else if op == "-" {
            let n1 = Double(number1) ?? 0
            let n2 = Double(number2) ?? 0
            let res = n1 - n2
            result = String(res)
        } else if op == "*" {
            let n1 = Double(number1) ?? 0
            let n2 = Double(number2) ?? 0
            let res = n1 * n2
            result = String(res)
        } else if op == "/" {
            let n1 = Double(number1) ?? 0
            let n2 = Double(number2) ?? 0
            let res = n1 / n2
            result = String(res)
        }
    }
}

struct CalcByOpenAI_Previews: PreviewProvider {
    static var previews: some View {
        CalcByOpenAI()
    }
}
