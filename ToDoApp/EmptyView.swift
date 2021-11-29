//
//  EmptyView.swift
//  ToDoApp
//
//  Created by VB on 29.11.2021.
//

import SwiftUI

struct EmptyView: View {
    @State var animations : Bool = false
    var body: some View {
        VStack{
            Text("OOps!")
                .font(.title)
            Text("In order not to forget things, either take notes or solve sudoku :)")
            NavigationLink() {
                AddNewTaskView()
            }label: {
                Text("Take some notes!")
                    .bold()
                    .frame(width:150, height: 50)
                    .background(animations ? Color("firstButtonColor") : Color("secondButtonColor"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(color: animations ? Color("firstButtonColor").opacity(3):Color("secondButtonColor").opacity(3), radius: animations ? 40 : 20, x: 0, y: animations ? 30 : 30)
            }
        }.multilineTextAlignment(.center)
            .padding(30)
            .onAppear(perform: Addanimation)
            .frame(maxWidth:.infinity, maxHeight:.infinity)
    }
    func Addanimation() {
        guard !animations else {return}
        DispatchQueue.main.asyncAfter(deadline: .now()+1.0){
            withAnimation(
                Animation.easeInOut(duration: 1.5).repeatForever()){
                    animations.toggle()
                }
        }
    }
}
struct ifEmpty_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
