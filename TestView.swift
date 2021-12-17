//
//  TestView.swift
//  ToDoApp
//
//  Created by VB on 16.12.2021.
//

import SwiftUI

struct TestView: View {
    let switchView :Bool = true
    var body: some View {
        switch switchView {
        case switchView == true :
            Text("31 ki ne")
        case switchView == false :
            Text("31 yok peppa sad")
        default :
            Text("WIK WIK ")
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
