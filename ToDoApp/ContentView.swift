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
                    Image(systemName: "note.text.badge.plus")
                        .foregroundColor(.black)
                }.environmentObject(ListViewModel())
            AddNewTaskView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                }
            ProfileTabView()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
