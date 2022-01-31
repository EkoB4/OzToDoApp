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
        VStack{
            HStack{
                Text("Hello There! My name is Ekin,")
                    .font(.title)
                    .bold()
                    .padding()
                    .multilineTextAlignment(.center)
                    .shadow(radius: 20)
                    .foregroundColor(.purple.opacity(0.5))
                    .frame(width: UIScreen.main.bounds.width/1,height: UIScreen.main.bounds.height/1)
                    .offset(y:-250)
                    .background(LinearGradient(gradient: Gradient(colors: [.white,.purple]),startPoint: .top,endPoint: .bottom))
                    .overlay(
                        Text("Im from Turkey and i living in Istanbul. Im 14 years old. I am a 9th grade student.Why did I create this app in the first place? Sometimes I forget basic things in my social life. And I said I need a note taking app. And I designed this app. It was a sweet application. I hope you have fun using it :)").bold()
                            .padding()
                            .foregroundColor(.white)
                            .shadow(radius: 100)
                            .multilineTextAlignment(.center)
                            .font(.title2)
                    )
            }        }
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
