//
//  EmojiTestView.swift
//  ToDoApp
//
//  Created by VB on 6.01.2022.
//

/*import SwiftUI

struct EmojiTestView: View {
    @State var show = false
    @State var value = ""
    var body: some View {
        ZStack(alignment:.bottom){
        GeometryReader{_ in
            VStack{
                HStack(spacing:15){
                    TextField("test", text: $value)
                    Button {
                        UIApplication.shared.windows.first?.rootViewController?.view.endEditing(true)
                        self.show.toggle()
                    } label: {
                        Image(systemName: "smiley").foregroundColor(.gray)
                    }
                }.padding(13)
                    .background(Color.white)
                    .clipShape(Capsule())
            }
        }
            EmojiView(show: self.$show, value: self.$value).offset(y: self.show ?  (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! : UIScreen.main.bounds.height)
        }.background(Color.gray).edgesIgnoringSafeArea(.all)
    }
}
struct EmojiView: View {
    @Binding var show : Bool
    @Binding var value : String
    var body: some View{
        ZStack(alignment:.topLeading){
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing:15){
                    ForEach(self.getEmoji(),id:\.self){emoji in
                        HStack(spacing:15){
                        ForEach(emoji, id: \.self){j in
                            Button {
                                self.value += String(UnicodeScalar(j)!)                             } label: {
                                if (UnicodeScalar(j)?.properties.isEmoji)!{
                                    Text(String(UnicodeScalar(j)!)).font(.system(size:55))
                                }else{
                                    Text("")
                                }
                            }
                         }
                        }
                    }
                }
            }.frame(width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height/3)
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .background(Color.white)
                .cornerRadius(25)
            Button {
                self.show.toggle()
            } label: {
                Image(systemName: "xmark").foregroundColor(.red).padding()
            }

        }
    }
    func getEmoji()->[[Int]]{
        var emojiArray : [[Int]] = []
        
        for emojiCodes in stride(from:0x1F601, to: 0x1F64F, by: 4){
            var temp :[Int] = []
            for j in emojiCodes...emojiCodes+2{
                
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
*/
