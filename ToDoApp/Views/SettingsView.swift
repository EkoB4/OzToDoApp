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
            Text("Me")
                .font(.title)
                .bold()
                .background(RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                                .frame(width: 150, height: 60, alignment: .topLeading))
            HStack{
                Text("Hi my name is Ekin, i'm living in Turkey. im in highschool(9th grade , Turk Kizilayi Anadolu Lisesi) I wrote this app for take speed notes. My github in 'socials', you can visit ( :").bold()
                    .frame(width:UIScreen.main.bounds.height/2.5)
                    .background(RoundedRectangle(cornerRadius: 20)
                                    .frame(maxWidth: 350, maxHeight: 350)
                                    .foregroundColor(Color.white))
                    .position(x: 200, y: 150)
             
                NavigationLink {
                    SocialsView()
                } label: {
                    Text("Go On Socials")
                        .foregroundColor(.red)
                        .background(RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: 350, maxHeight: 350))
                        .position(x: 20, y: 400)

                }

            }
        }.background(Color("TextColor"))
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
    @AppStorage("isDarkMode") private var isDark = false
    var body: some View{
        NavigationView{
            VStack{
                GeometryReader{_ in
            HStack{
       Image("Dark")
                    .frame(width:UIScreen.main.bounds.width*0.5 , height: UIScreen.main.bounds.height/2)
        Image("LightTheme")
                    .frame(width: UIScreen.main.bounds.width*0.5)
            }
                Text("Theme Settings")
                        .bold()
                        .frame(width:UIScreen.main.bounds.width*1,height: UIScreen.main.bounds.height/100)
                        .font(.title).offset(y:-100)
                 Text("Dark Screen")
                        .bold()
                        .frame(width: UIScreen.main.bounds.width*0.5, height: UIScreen.main.bounds.height/20)
                    
                    Text("Light Screen")
                        .frame(width:UIScreen.main.bounds.width*1.5, height: UIScreen.main.bounds.height/20)
                    Button {
                        isDark.toggle()
                    } label: {
                        Text("Change Theme!")
                            .bold()
                            .foregroundColor(Color("TextColor"))
                            .background(RoundedRectangle(cornerRadius: 20)
                                            .fill(.white)
                                            .frame(width:150,height: 50))
                    }.offset(x:130 , y:330)
                }
            }.background(Color("TextColor").opacity(0.3))
            Spacer()
        }
        .environment(\.colorScheme, isDark ? .dark : .light )
    }
}
struct AllPreviews : PreviewProvider {
    static var previews: some View{
        AboutMeView()
        SocialsView()
        DarkTheme()
    }
}
