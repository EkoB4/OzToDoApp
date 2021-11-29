//
//  ProfileView.swift
//  ToDoApp
//
//  Created by VB on 29.11.2021.
//


import SwiftUI

struct profileTab: View {
    var body: some View {
        Image("ProfileImage")
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .overlay(Circle().stroke(.gray, lineWidth: 4))
    }
}

struct profileTab_Previews: PreviewProvider {
    static var previews: some View {
        profileTab()
    }
}
