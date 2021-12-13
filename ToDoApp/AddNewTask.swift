//
//  AddNewTask.swift
//  ToDoApp
//
//  Created by VB on 29.11.2021.
//

import SwiftUI
struct AddNewTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var userText :String =  ""
    
    @State var alertText : String = ""
    @State var showAlert : Bool = false
    
    @State var EndDate = Date()
    var dateFormatter : DateFormatter{
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .medium
        return dateFormat
    }
    var body: some View {
        ScrollView{
            VStack{
                TextField("Add item 🖊", text : $userText)
                    .padding()
                    .background(Color.white.opacity(0.3 ))
                    .cornerRadius(10)
                    .frame(height:50)
                    
               // Text("Endate")
               // Text(dateFormatter.string(from: EndDate))
                DatePicker("",selection: $EndDate, in:Date.now...,displayedComponents: .date)
                    .labelsHidden()
                    .frame(maxHeight:400)
                    .datePickerStyle(.graphical)
                    .accentColor(Color("BackgroundColor"))
                Button(action: saveButtonPressed, label: {
                                 Text("Save".uppercased())
                                     .foregroundColor(.white)
                                     .font(.headline)
                                     .frame(height: 55)
                                     .frame(maxWidth: .infinity)
                                     .background(Color("BackgroundColor"))
                                     .cornerRadius(10)
                             })
            }
            
            
        }
        .padding(14)
        .navigationBarTitle("Add Task")
        .alert(isPresented: $showAlert, content: alertCome)
        
    }
    
    func saveButtonPressed(){
        if textApporitate(){
            listViewModel.addItem(title:userText+dateFormatter.string(from: EndDate))
            presentationMode.wrappedValue.dismiss()
        }
    }
    func textApporitate() -> Bool{
        if userText.isEmpty{
            alertText="the field cannot be empty"
            showAlert.toggle()
            return false
        }
        /*if userText.count < 3 {
         alertText="the field cannot be empty"
         showAlert.toggle()
         return false
         }*/
        return true
    }
    func alertCome() -> Alert{
        return Alert(title: Text(alertText))
    }
}

struct addNew_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddNewTaskView()
        }
        .environmentObject(ListViewModel())
    }
}
