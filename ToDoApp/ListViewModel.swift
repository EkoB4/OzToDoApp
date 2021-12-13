//
//  ProfileTab.swift
//  ToDoApp
//
//  Created by VB on 29.11.2021.
//

import Foundation
import UIKit
import SwiftUI

class ListViewModel : ObservableObject {
    @Published var  itemTexts : [itemModel] = [] {
        didSet{
            saveList()
        }
     }
    let itemsKey : String = "itemList"
    init(){
        getItems()
    }
    func getItems(){
        guard
        let data = UserDefaults.standard.data(forKey: itemsKey),
        let savedItems = try? JSONDecoder().decode([itemModel].self ,from: data)
        else{return}
        self.itemTexts = savedItems
    }
    func deleteItem(indexSet : IndexSet){
        itemTexts.remove(atOffsets: indexSet)
      /*  let deleteItem = itemModel(title: deletedTitle, isFinished: false)
        items.append(deleteItem)*/
    }
    func moveItem(from : IndexSet , to : Int ){
        itemTexts.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title:String){
        let addNewItem = itemModel(title: title, isFinished: true,DeadDate: "")
        itemTexts.append(addNewItem)
    }
   
    func updateItem(item: itemModel){
        if let index = itemTexts.firstIndex(where: { $0.id == item.id }){
            itemTexts[index] = item.isUpdateComplated()
        }
    }
    func saveList(){
            if let encodedData = try? JSONEncoder().encode(itemTexts){
                UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
   }
 }
