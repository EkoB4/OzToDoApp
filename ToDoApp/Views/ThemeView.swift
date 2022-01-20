//
//  ThemeView.swift
//  ToDoApp
//
//  Created by VB on 15.01.2022.
//

import Foundation
import SwiftUI

struct ThemeView : View {
    var body: some View{
            GeometryReader{_ in
                VStack{
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.white)
                        .frame(height:UIScreen.main.bounds.height/2).offset(y:250)
                    SocialIcon()
                        .frame(height: UIScreen.main.bounds.height/8)
                        .offset(y:40)
                    ThemeIcon()
                        .frame(height: UIScreen.main.bounds.height/2.5
                        ).offset(y:-160)
                        
                    AboutMe()
                        .offset(y:-210)
                    
                }.background(Color.black)
            }
        }
    }

struct ThemeViewPreviews : PreviewProvider {
    static var previews: some View {
        ThemeView()
        SocialIcon().previewLayout(.sizeThatFits)
        ThemeIcon().previewLayout(.sizeThatFits)
        AboutMe().previewLayout(.sizeThatFits)
    }
}

struct SocialIcon: View{
    var body : some View{
        VStack{
            GeometryReader{_ in
                RoundedRectangle(cornerRadius: 20)
                    .frame(width:UIScreen.main.bounds.width*0.2,height: UIScreen.main.bounds.height/10)
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
                    .overlay(Image(systemName: "sun.min.fill")
                                .foregroundColor(.purple))
                    .foregroundColor(Color("firstButtonColor")).opacity(0.6)
                    .overlay(NavigationLink(destination: {
                        ThemeView()
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
                    .overlay(Image(systemName: "person")
                                .foregroundColor(.pink))
                    .foregroundColor(.pink).opacity(0.4)
                    .overlay(NavigationLink(destination: {
                        ThemeView()
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

