//
//  EmojiTestView.swift
//  ToDoApp
//
//  Created by VB on 6.01.2022.
//

import SwiftUI

struct EmojiTestView: View {
    var body: some View {
        ZStack(alignment:.topLeading){
        GeometryReader{_ in
            Text("")
        }
        EmojiView()
        }.background(Color.gray).edgesIgnoringSafeArea(.all)
    }
}
struct EmojiView: View {
    var body: some View{
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing:15){
                ForEach(self.getEmoji(),id:\.self){emoji in
                    HStack(spacing:15){
                    ForEach(emoji, id: \.self){j in
                        Button {
                        } label: {
                            if (UnicodeScalar(j)?.properties.isEmoji)!{
                                Text(String(UnicodeScalar(j)!)).font(.system(size:55))
                            }
                        }
                     }
                    }
                }
            }
        }.frame(width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height/3)
            .background(Color.white)
            .cornerRadius(25)
    }
    func getEmoji()->[[Int]]{
        var emojiArray : [[Int]] = []
        
        for emojiCodes in 0x1F601...0x1F64F{
            var temp :[Int] = []
            for j in emojiCodes...emojiCodes+3{
                
                temp.append(j)
            }
            emojiArray.append(temp)
        }
       return emojiArray
    }
}
struct EmojiTestView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiTestView()
    }
}
