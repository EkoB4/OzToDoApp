//
//  File.swift
//  ToDoApp
//
//  Created by VB on 29.11.2021.
//

import Foundation
import SwiftUI

struct GitImageView : View{
    var body: some View{
        VStack{
            Rectangle()
                .frame(width: 280, height: 70)
                .foregroundColor(Color("TextColor")).opacity(0.1)
                .cornerRadius(20)
                .offset(y:130)
             
        Image("github-logo")
                .resizable()
                .clipped()
                .scaledToFit()
                .frame(height: 60).offset(x: -100, y: 55)
            Link(destination: URL(string:"https://github.com/EkoB4")!) {
                Text("GitHub")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                    //.offset(y:-80)
                    .shadow(radius: 20)
            }
        }
    }
}

struct InstagramImageView : View {
    var body: some View{
        VStack{
            Rectangle()
                .frame(width:280, height: 70)
                .foregroundColor(Color("TextColor").opacity(0.1))
                .opacity(0.8)
                .cornerRadius(20)
                .offset(y:130)

        Image("instagram")
                .resizable()
                .clipped()
                .scaledToFit()
                .frame(height: 60).offset(x: -100, y: 55)
            Link(destination: URL(string:"https://www.instagram.com/ekinbacik/")!) {
                Text("Instagram")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                    .shadow(radius: 20)
            }
        }
    }
    }


struct MailImageView : View {
    var body : some View{
        VStack{
            Rectangle()
                .frame(width: 280, height: 70)
                .foregroundColor(Color("TextColor").opacity(0.1)).opacity(0.8)
                .cornerRadius(20)
                .offset(y:130)
        Image("mail")
                .resizable()
                .clipped()
                .scaledToFit()
                .frame(height: 60).offset(x: -100, y: 55)
            
            Link(destination: URL(string:"https://mail.google.com/mail/u/0/#inbox?compose=CllgCJTHWJWVlRvHLSRfzbQXPdqPnWdvhXjZXlmkLLSpCFDhggLPmgsqWBwwXFqcbXhSDVMFlxV")!) {
                Text("Gmail")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                    .shadow(radius: 20)
            }
        }
    }
}
struct AllSocials: View {
    @Environment(\.colorScheme) var textColors 
    var body: some View{
        HStack(alignment:.bottom){
            GeometryReader{_ in
        RoundedRectangle(cornerRadius: 20)
                    .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height/2.3)
                    .foregroundColor(textColors == .light ? .white : .black)
                    .padding(14)
                MailImageView()
                    .frame(width: UIScreen.main.bounds.width*1, height: UIScreen.main.bounds.height/50)
                InstagramImageView()
                    .frame(width: UIScreen.main.bounds.width*1, height: UIScreen.main.bounds.height/4)
                GitImageView()
                    .frame(width: UIScreen.main.bounds.width*1, height: UIScreen.main.bounds.height/2)
            }
        }
    }
}
struct imageView_Previews : PreviewProvider{
    static var previews: some View{
        GitImageView().previewLayout(.sizeThatFits)
        InstagramImageView().previewLayout(.sizeThatFits)
        MailImageView().previewLayout(.sizeThatFits)
        AllSocials().previewLayout(.sizeThatFits)
    }
}
