//
//  CustomTabBar.swift
//  ToDoApp
//
//  Created by VB on 23.01.2022.
//

import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct tabBarView : View {
    @State var selectedTab = "AddNote"
    init(){
        UITabBar.appearance().isHidden = true
    }
    @State var xPosition : CGFloat = 0
    var body: some View{
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            
            TabView(selection: $selectedTab){
                Color.red
                    .ignoresSafeArea(.all,edges: .all)
                    .tag("AddNote")
                Color.blue
                    .ignoresSafeArea(.all,edges: .all)
                    .tag("Settings")
            }
            HStack(spacing:0){
                ForEach(TabIcons,id:\.self){icons in
                    GeometryReader{reader in
                    Button(action: {
                        selectedTab = icons
                    }) {
                        Image(icons)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width:25,height: 25)
                            .foregroundColor(selectedTab == icons ? tabBarIconColor(icon: icons):Color.gray)
                            .padding(selectedTab == icons ? 15 :0)
                            .background(Color.white.opacity(selectedTab == icons ? 1 : 0))
                            .offset(x:reader.frame(in: .global).minX - reader.frame(in: .global).midX,y:selectedTab == icons ? -40 : 0)
                    }.onAppear(perform: {
                        if icons == TabIcons.first{
                            xPosition = reader.frame(in: .global).midX
                        }
                    })
                    if icons != TabIcons.last{
                        Spacer(minLength: 2)
                    }
                }
            }
                
            }.frame(width:135,height: 25)
            .padding(.horizontal,50)
                .padding(.vertical)
                .background(Color.white.clipShape(cornerAnimation(xPosition: xPosition)))
                .cornerRadius(20)
                .padding()
        }
    }
    func tabBarIconColor(icon :String) -> Color{
            switch icon {
            case "AddNote":
                return(Color.red)
            case "Settings":
                return(Color.green)
            default:
                return(Color.blue)
            }
            
        }
}

struct cornerAnimation : Shape {
    var xPosition : CGFloat
    func path(in rect: CGRect) -> Path {
        return Path{path in
            path.move(to: CGPoint(x:0,y:0))
            path.addLine(to: CGPoint(x: rect.width,y:0))
            path.addLine(to: CGPoint(x: rect.width,y:rect.height))
            path.addLine(to: CGPoint(x: 0,y:rect.height))
            
            let center = xPosition
            path.move(to: CGPoint(x:center-50, y: 0))
            
            let to1 = CGPoint(x:center, y:35)
            let control1 = CGPoint(x:center - 25,y:0)
            let control2 = CGPoint(x:center - 25,y:35)
            
            let to2 = CGPoint(x:center+50, y:0)
            let control3 = CGPoint(x:center + 25,y:35)
            let control4 = CGPoint(x:center + 25,y:0)
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)


            
        }
    }
}
var TabIcons = ["AddNote", "Settings"]
struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        tabBarView()
    }
}
