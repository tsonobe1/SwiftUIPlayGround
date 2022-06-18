//
//  Layout.swift
//  SwiftUIPlayGround
//
//  Created by 薗部拓人 on 2022/06/18.
//

import SwiftUI

struct Layout: View {
    var body: some View {
        VStack{
            /*
             MARK: PositionとOffsetとFrameとPaddingの使い方
             # Position
             - デフォは親Viewの中央値に設置
             - 任意で値を定めた場合は、親Viewの左上端から起算する
             
             # Offset
             - offsetを設定する前の自身のViewの、左上端から起算した場所に移動する
             
             
             # padding
             - 自身のViewの周囲に空白を設ける
             
             # Frame
             - 自身のViewに、指定した枠を作成する
             - frameを作成した後に、offset・positionを指定すると、起点はframeの左上からになる
             - frameを作成した後に、paddingを設定すると、確保したframeの中でpaddingする
             */
            
            
            Group{
                // MARK: PositionとFrame
                // 1 positionの初期値(親Viewの中央値)の位置に、100*100のframeを作成
                // 2 そのframe左上端の位置から、x:100 y:100の位置に移動する
                
                // MARK: 1
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                    Text("1").font(.title).bold()
                }
                        .foregroundColor(.red).opacity(0.5)
                        .border(.black)
                        .position(x: 80, y: 80)
                        .border(.blue)
                        .frame(width: 80, height: 80)

                // divider
                ZStack{
                    Rectangle()
                        .foregroundColor(.black)
                        .frame(height: 15)
                    Text("Divider")
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }
            
            
            Group{
                // 1 親Viewの左上端の位置からx:100 y:100の位置に移動する
                // 2 その位置にframeを作成する
                
                // MARK: 2
                ZStack{
                    RoundedRectangle(cornerRadius: 20).opacity(0.5)
                    Text("2").font(.title).bold()
                }
                        .border(.brown)
                        .foregroundColor(.blue)
                        .frame(width: 80, height: 80)
                        .position(x: 80, y: 80)
                 
                // divider
                ZStack{
                    Rectangle()
                        .foregroundColor(.black)
                        .frame(height: 15)
                    Text("Divider")
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }
            
            
            Group{
                // MARK: OffsetとPosition
                // Positionを指定した場合、親Viewの左上端から起算してx50, y50の位置に移動
                
                // MARK: 3
                ZStack{
                RoundedRectangle(cornerRadius: 20).opacity(0.5)
                    Text("3").font(.title).bold()
                }
                    .foregroundColor(.yellow)
                    .frame(width: 50, height: 50)
                    .position(x: 50, y: 50)
                
                // divider
                ZStack{
                    Rectangle()
                        .foregroundColor(.black)
                        .frame(height: 15)
                    Text("Divider")
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }
            
            
            Group{
                // Offsetを指定した場合、positionの初期値(親Viewの中央値)=offsetを使う前の自身のViewの位置からx50, y50に移動
                
                // MARK: 4
                ZStack{
                RoundedRectangle(cornerRadius: 20).opacity(0.5)
                    Text("4").font(.title).bold()
                }
                    .foregroundColor(.yellow)
                    .frame(width: 50, height: 50)
                    .offset(x: 50, y: 50)
                
                // divider
                ZStack{
                    Rectangle()
                        .foregroundColor(.black)
                        .frame(height: 15)
                    Text("Divider")
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }
            
            
            // MARK: FrameとPadding
            
            // MARK: 5
            HStack{
                // frame→paddingnの順だと、rectangleがframeの枠内で、paddingsされる
            RoundedRectangle(cornerRadius: 20).opacity(0.5)
                .foregroundColor(.gray)
                .border(.green)
                .padding(.top, 20)
                .border(.red)
                .frame(width: 80, height: 50)
            
                // padding→frameの順だと、rectangleをpaddingした後に、frameを生成する
            RoundedRectangle(cornerRadius: 20).opacity(0.5)
                .foregroundColor(.gray)
                .border(.green)
                .frame(width: 80, height: 50)
                .border(.red)
                .padding(.top, 20)
                
            }
        }
    }
}

struct Layout_Previews: PreviewProvider {
    static var previews: some View {
        Layout()
    }
}
