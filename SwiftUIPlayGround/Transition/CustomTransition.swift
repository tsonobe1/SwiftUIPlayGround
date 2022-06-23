//
//  CustomTransition.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/22.
//

import SwiftUI


//MARK: withAnimation
extension Color {
    public init(red:Int,green:Int,blue:Int) {
        self = Color(red:Double(red)/255.0,
                     green:Double(green)/255.0,
                     blue:Double(blue)/255.0)
    }
}
extension View{
    func makeCardStyle() -> some View{
        self.padding()
            .background(Color(red:150,green:150,blue:200))
            .cornerRadius(8)
            .shadow(radius:4,x:10,y:15)
    }
}

struct TransitionSwitchView: View{
    @State private var on = false
    @State private var selection: Int = 0
    
    var body: some View{
        VStack{
            ShowPicker(selection: self.$selection, pickerName: "Transition Option", items: ["identity", "slide", "opacity", "scale", "move", "offset"], style: SegmentedPickerStyle()).padding(20)
            
            Button(action: { withAnimation{ self.on.toggle() }}){
                on ? Text("Back") : Text("SubView")
            }
            .animation(nil, value: on)
            .frame(width: 250)
            .foregroundColor(Color(red: 100, green: 180, blue: 240))
            .font(.system(size: 24, weight: .bold))
            
            Spacer()
            if on{
                TransitionChoice(selection:self.selection)
            }
            Spacer()
            Spacer()
            Spacer()
            
        }
    }

    struct TransitionSwitchView_Previews: PreviewProvider {
        static var previews: some View {
            TransitionSwitchView()
        }
    }
}


struct TransitionChoice: View{
    var selection: Int
    
    var body: some View {
        switch self.selection {
        case 0: return AnyView(SubView1(message: "0").transition(.identity).makeCardStyle())
        case 1: return AnyView(SubView1(message: "0").transition(.slide).makeCardStyle())
        case 2: return AnyView(SubView1(message: "0").transition(.opacity).makeCardStyle())
        case 3: return AnyView(SubView1(message: "0").transition(.scale).makeCardStyle())
        case 4: return AnyView(SubView1(message: "0").transition(.move(edge: .leading)).makeCardStyle())
        case 5: return AnyView(SubView1(message: "0").transition(.offset(x: 100, y: 100)).makeCardStyle())
        default:
            return AnyView(EmptyView())
        }
    }
}

struct SubView1: View{
    var message: String
    var body: some View{
        Text("SubView"+message)
        .font(.system(size:32,weight:.bold))}}


struct ShowPicker<S:PickerStyle>: View{
    @Binding var selection: Int
    let pickerName: String
    let items: [String]
    let style:S
    
    //SegmentedPickerStyle()orWheelPickerStyle()
    var body: some View {
        VStack(alignment:.center){
            Text(pickerName)
                .font(.system(size:20,weight:.bold))
            Picker(selection: self.$selection,
                   label:EmptyView()
            ){
                ForEach( 0..<items.count ){ index in
                    Text(self.items[index])
                        .tag(index)
                }
            }
            .pickerStyle(style)
        }
    }
}





