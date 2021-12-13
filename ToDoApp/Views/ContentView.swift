//
//  ContentView.swift
//  ToDoApp
//
//  Created by VB on 29.11.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            TodoListView()
                .tabItem {
                    Image(systemName: "note.text.badge.plus").renderingMode(.template)
                }.environmentObject(ListViewModel())
            ProfileTabView()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill").background(Color.red)
                }
        }.accentColor(Color("BackgroundColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
