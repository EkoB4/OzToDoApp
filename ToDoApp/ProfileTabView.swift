//
//  ProfileTabView.swift
//  ToDoApp
//
//  Created by VB on 29.11.2021.
//

import SwiftUI

struct ProfileTabView : View{
    var body: some View{
        VStack{
            GeometryReader{ pos in
                Rectangle()
                    .foregroundColor(Color("buttonColor"))
                    .frame(width: pos.size.width*1,height: pos.size.height*0.5)//.cornerRadius(10)
                    .ignoresSafeArea()
                Text("Ekin Can Bacik")
                    .font(.title)
                    .bold()
                    .frame(width: pos.size.width*1, height: pos.size.height*0.67)
                    .foregroundColor(.white)
                Text("These are my social media accounts")
                    .font(.subheadline)
                    .bold()
                    .frame(width: pos.size.width*1, height: pos.size.height*0.83).foregroundColor(.white)
                Divider()
                    .background(Color.white)
                    .frame(width: pos.size.width*0.5, height: pos.size.height*0.78).offset(x:90)
                GitImageView()
                    .frame(width: pos.size.width*1, height: pos.size.height*1.76)
                InstagramImageView()
                    .frame(width: pos.size.width*1, height: pos.size.height*1.5)
                MailImageView()
                    .frame(width: pos.size.width*1, height: pos.size.height*1.25)
                profileTab()
                    .frame(width: pos.size.width*1, height: pos.size.height*0.3)
            }
        }
    }
}

struct Previews : PreviewProvider {
    static var previews: some View{
        ProfileTabView()
    }
}
