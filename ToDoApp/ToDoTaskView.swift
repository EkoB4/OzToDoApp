//
//  ToDoTaskView.swift
//  ToDoApp
//
//  Created by VB on 29.11.2021.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var listViewModel :ListViewModel
   /* init() {
        listViewModel = ListViewModel()
    }*/
    var body: some View {
        NavigationView {
            ZStack{
                if listViewModel.itemTexts.isEmpty{
                    EmptyView()
                }else{
                    List{
                        ForEach(listViewModel.itemTexts){ item in
                            rowListView(value:item)
                                .onTapGesture {
                                    withAnimation(.linear){
                                        listViewModel.updateItem(item: item)
                                    }
                                }
                        }
                        .onDelete(perform:listViewModel.deleteItem)
                        .onMove(perform:listViewModel.moveItem)
                        
                    }
                }
            }
            /*Navigation Bar items*/
            //.listStyle(PlainListStyle())
            .navigationBarTitle("To Do App")
            .navigationBarItems(leading: EditButton().foregroundColor(Color("TextColor")),
                                trailing: NavigationLink(destination: AddNewTaskView(), label: {
                Text("Add")
                    .bold()
                    .foregroundColor(Color("TextColor"))
            })
            )
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}

/*struct rowList : View {
 var body: some View{
 HStack{
 Image(systemName:"checkmark.circle.fill")
 Text("This is the first item")
 Spacer()
 }
 }
 }*/
