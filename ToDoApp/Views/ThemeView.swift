//
//  ThemeView.swift
//  ToDoApp
//
//  Created by VB on 15.01.2022.
//

import Foundation
import SwiftUI

struct ElementsRectangle: View {
    var body: some View{
        GeometryReader{_ in
            VStack{
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.white)
                    .frame(height:UIScreen.main.bounds.height/2)
                    .overlay(SocialIcon()
                                .frame(height: UIScreen.main.bounds.height/2.3))
                    .overlay( ThemeIcon()
                                .frame(height: UIScreen.main.bounds.height/6))
                    .overlay(AboutMe()
                                .frame(height: UIScreen.main.bounds.height/20).offset(y:60))
            }
        }
    }
}
struct ThemeViewPreviews : PreviewProvider {
    static var previews: some View {
        ElementsRectangle().previewLayout(.sizeThatFits)
        SocialIcon().previewLayout(.sizeThatFits)
        ThemeIcon().previewLayout(.sizeThatFits)
        AboutMe().previewLayout(.sizeThatFits)
        OptinionsScreen()
    }
}

struct SocialIcon: View{
    var body : some View{
        VStack{
            GeometryReader{_ in
                RoundedRectangle(cornerRadius: 20)
                    .frame(width:UIScreen.main.bounds.width*0.2,height: UIScreen.main.bounds.height/10)
                    .padding()
                    .overlay(Image(systemName: "rectangle.3.offgrid")
                                .foregroundColor(.green))
                    .foregroundColor(.green).opacity(0.5)
                    .overlay(NavigationLink(destination: {
                        SocialsView()
                    }, label: {
                        Text("Socials")
                            .bold()
                            .font(.title)
                            .foregroundColor(.black)
                            .frame(width:UIScreen.main.bounds.width/2)
                            .offset(x:100)
                        
                    }))
            }
        }
    }
}
struct ThemeIcon: View{
    var body : some View{
        VStack{
            GeometryReader{_ in
                RoundedRectangle(cornerRadius: 20)
                    .frame(width:UIScreen.main.bounds.width*0.2,height: UIScreen.main.bounds.height/10)
                    .padding()
                    .overlay(Image(systemName: "sun.min.fill")
                                .foregroundColor(.purple))
                    .foregroundColor(Color("firstButtonColor")).opacity(0.6)
                    .overlay(NavigationLink(destination: {
                        DarkTheme()
                    }, label: {
                        Text("Theme")
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                            .frame(width:UIScreen.main.bounds.width/2)
                            .offset(x:100)
                    }))
            }
        }
    }
}
struct AboutMe: View{
    var body : some View{
        VStack{
            GeometryReader{_ in
                RoundedRectangle(cornerRadius: 20)
                    .frame(width:UIScreen.main.bounds.width*0.2,height: UIScreen.main.bounds.height/10)
                    .padding()
                    .overlay(Image(systemName: "person")
                                .foregroundColor(.pink))
                    .foregroundColor(.pink).opacity(0.4)
                    .overlay(NavigationLink(destination: {
                        AboutMeView()
                    }, label: {
                        Text("About Me")
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                            .frame(width:UIScreen.main.bounds.width/2)
                            .offset(x:110)
                    }))
            }
        }
    }
}

struct OptinionsScreen : View {
    var body : some View {
        VStack{
        NavigationView{
            VStack{
                Text("Settings Tab")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                VStack{
                    Spacer(minLength: 60)
                    ElementsRectangle()
                        .padding()
                }
                
            }.background(Color("ThemeColor"))
        }
        }
    }
}

