//
//  SettingsView.swift
//  ToDoApp
//
//  Created by VB on 18.01.2022.
//

import Foundation
import SwiftUI

struct AboutMeView : View{
    var body: some View{
        NavigationView{
        VStack{
            HStack{
                Text("Hi my name is Ekin, i'm living in Turkey. im in highschool(9th grade , Turk Kizilayi Anadolu Lisesi) I wrote this app for take speed notes. My github in 'socials', you can visit ( :").bold()
                    .frame(width:UIScreen.main.bounds.height/4)
                    .background(RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 200, height: 350)
                                    .foregroundColor(Color("TextColor")))
                    .navigationTitle("About Me:")
            }
          }
        }
}
}

struct SocialsView : View{
    var body: some View{
        VStack{
            GeometryReader{ pos in
                Rectangle()
                    .foregroundColor(Color("buttonColor"))
                    .frame(width: pos.size.width*1,height: pos.size.height*1)//.cornerRadius(10)
                    .ignoresSafeArea()
                Text("Ekin Can Bacik")
                    .font(.title)
                    .bold()
                    .frame(width: pos.size.width*1, height: pos.size.height*0.3)
                    .foregroundColor(.white)
                Text("These are my social media accounts")
                    .font(.subheadline)
                    .bold()
                    .frame(width: pos.size.width*1, height: pos.size.height*0.4).foregroundColor(.white)
                profileTab()
                    .frame(width: pos.size.width*1, height: pos.size.height/20)
                AllSocials()
                    .offset(x:10,y:180)
                    
            }
        }
    }
}


struct DarkTheme : View {
    var body: some View{
        NavigationView{
            VStack{
                GeometryReader{_ in
            HStack{
       Image("Dark")
                    .frame(width:UIScreen.main.bounds.width*0.5 , height: UIScreen.main.bounds.height/1.5)
        Image("LightTheme")
                    .frame(width: UIScreen.main.bounds.width*0.5)
            
            }.navigationTitle("THEME SETTINGS")
                 Text("Dark Screen")
                        .bold()
                        .frame(width: UIScreen.main.bounds.width*0.5, height: UIScreen.main.bounds.height/4)
                    
                    Text("Light Screen")
                        .frame(width:UIScreen.main.bounds.width*1.5, height: UIScreen.main.bounds.height/4)
                }
            }.background(Color("TextColor").opacity(0.3))
        }
}
}
struct AllPreviews : PreviewProvider {
    static var previews: some View{
        AboutMeView()
        SocialsView()
        DarkTheme()
    }
}
