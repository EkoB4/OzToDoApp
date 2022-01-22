//
//  TabBarView.swift
//  ToDoApp
//
//  Created by VB on 22.01.2022.
//

import Foundation
import SwiftUI

struct TabBarView : View {
    var body: some View{
        Text("sa")
    }
}
struct TabBarView_Previews: PreviewProvider{
    static var previews: some View{
        TabBarView()
        Home()
    }
}

var tabIcons = ["AddNote", "Settings" ]
struct Home : View {
    @State var selectedTab = "AddNote"
    init(){
        UITabBar.appearance().isHidden = true
    }
    @State var xPosition : CGFloat = 0
    var body: some View{
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
        TabView(selection:$selectedTab){
            Color.red
                .ignoresSafeArea(.all, edges: .all)
                .tag("AddNote")
            Color.purple
                .ignoresSafeArea(.all,edges: .all)
                .tag("Settings")
        }
            HStack(spacing:50){
                ForEach(tabIcons,id: \.self){tabBarIcons in
                    GeometryReader{reader in
                    Button {
                        withAnimation(.spring()){
                            selectedTab = tabBarIcons
                            xPosition = reader.frame(in: .global).minX
                        }
                    } label: {
                        Image(tabBarIcons)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio( contentMode: .fit)
                            .frame(width:25,height: 25)
                            .foregroundColor(selectedTab == tabBarIcons ?
                                             tabBarIconColor(icon: tabBarIcons):Color.gray)
                            .padding(selectedTab == tabBarIcons ? 15 : 0)
                            .background(Color.white.opacity(selectedTab == tabBarIcons ? 1 : 0 ).clipShape(Circle()))
                            .matchedGeometryEffect(id: tabBarIcons, in: animation)
                            .offset(y: selectedTab == tabBarIcons ? -50 : 0)
                            .onAppear {
                                if tabBarIcons == tabIcons.first{
                                    xPosition = reader.frame(in: .global).minX
                                }
                            }
                    }
                    if tabBarIcons != tabIcons.last{
                        Spacer(minLength: 20)}
                            
                    }.frame(width:110,height:25)
                    
                }
              
            }
            .padding(.horizontal,30)
            .padding(.vertical)
            .background(Color.white.clipShape(cornerAnimation(xPosition: xPosition)).cornerRadius(20))
            .padding()
            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
        }
        .ignoresSafeArea(.all, edges: .bottom)
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
    var xPosition :CGFloat

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
