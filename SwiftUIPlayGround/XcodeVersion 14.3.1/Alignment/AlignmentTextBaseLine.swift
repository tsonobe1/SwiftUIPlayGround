//
//  AlignmentTextBaseLine.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/26.
//

import SwiftUI

struct AlignmentTextBaseLine: View {
    var body: some View {
        VStack{
            //MARK: bottom
            HStack(alignment: .bottom){
                Text("bottom")
                    .font(.title)
                    .foregroundColor(.green)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris")
                    .font(.caption)
                    .foregroundColor(.primary)
                Image(systemName: "keyboard.fill")
                    .font(.system(size: 100))
            }
            .border(.black)
            Spacer()
            
            //MARK: lastTextBaseline
            HStack(alignment: .lastTextBaseline){
                Text("lastTextBaseline")
                    .font(.title)
                    .foregroundColor(.green)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris")
                    .font(.caption)
                    .foregroundColor(.primary)
                Image(systemName: "keyboard.fill")
                    .font(.system(size: 100))
            }
            .border(.black)
            Spacer()
            
            //MARK: top
            HStack(alignment: .top){
                Text("top")
                    .font(.title)
                    .foregroundColor(.green)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris")
                    .font(.caption)
                    .foregroundColor(.primary)
                Image(systemName: "keyboard.fill")
                    .font(.system(size: 100))
            }
            .border(.black)
            Spacer()
            
            //MARK: firstTextBaseline
            HStack(alignment: .firstTextBaseline){
                Text("first")
                    .font(.title)
                    .foregroundColor(.green)
                Text("Lorem ipsum dolor sit amet, consectetur")
                    .font(.caption)
                    .foregroundColor(.primary)
                Image(systemName: "keyboard.fill")
                    .font(.system(size: 100))
                    .alignmentGuide(.firstTextBaseline){_ in 100 } // +だと上方向移動
                Image(systemName: "keyboard.fill")
                    .font(.system(size: 100))
                    .alignmentGuide(.firstTextBaseline){_ in -100 } // -だと下方向移動
            }
            .border(.black)
            
        }
    }
}

struct AlignmentTextBaseLine_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentTextBaseLine()
    }
}
