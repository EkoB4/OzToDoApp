//
//  ItemModel.swift
//  ToDoApp
//
//  Created by VB on 29.11.2021.
//


import Foundation
import SwiftUI
struct itemModel : Identifiable , Codable {
    var id : String = UUID().uuidString
    let title : String
    let isFinished : Bool
    
    init(id: String = UUID().uuidString,title : String, isFinished:Bool){
        self.title = title
        self.id = id
        self.isFinished = isFinished
    }
    func isUpdateComplated()-> itemModel{
        return itemModel(id: id ,title: title, isFinished: !isFinished)
    }
    
}
