//
//  AddNewTask.swift
//  ToDoApp
//
//  Created by VB on 29.11.2021.
//
import BottomSheet_SwiftUI
import SwiftUI
struct AddNewTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var userText :String =  ""
    
    @State var alertText : String = ""
    @State var showAlert : Bool = false
    @State var EndDate = Date()
    @State var IsOk : Bool = false
    @State var show = false
    var dateFormatter : DateFormatter{
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .short
        return dateFormat
    }
    @State private var isSheetOpen = false
    var body: some View {
            VStack{
                HStack{
                TextField("Add item 🖊", text : $userText)
                    .padding()
                    .background(Color.white.opacity(0.3 ))
                    .cornerRadius(10)
                    .frame(height:50)
                }
                if IsOk{
                    DatePicker("",selection: $EndDate, in:Date.now...,displayedComponents: .date)
                        .labelsHidden()
                        .frame(maxHeight:400)
                        .datePickerStyle(.graphical)
                        .accentColor(Color("BackgroundColor"))
                }
                Toggle(isOn: $IsOk) {
                    Text("Add a Date 📅")
                        .bold()
                }.tint(Color("BackgroundColor"))
                Button(action: saveButtonPressed, label: {
                                 Text("Save".uppercased())
                                     .foregroundColor(.white)
                                     .font(.headline)
                                     .frame(height: 55)
                                     .frame(maxWidth: .infinity)
                                     .background(Color("BackgroundColor"))
                                     .cornerRadius(10)
                             })
                BottomSheet(
                              isOpen: self.$isSheetOpen,
                              config: BottomSheetConfig(maxHeight: UIScreen.main.bounds.height/3)
                          ){
                              EmojiView(show: self.$show, userText: self.$userText)
                              Color.white
                          }

            }.padding(14)
        .navigationBarTitle("Add a new task")
        .alert(isPresented: $showAlert, content: alertCome)
        
    }
    
    func saveButtonPressed(){
        if textApporitate(){
            if IsOk{
                listViewModel.addItem(title:"\(userText)      End Day :\(dateFormatter.string(from: EndDate))")
            }else{
                listViewModel.addItem(title: userText)
            }
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
struct EmojiView: View {
    @Binding var show : Bool
    @Binding var userText : String
    var body: some View{
        ZStack(alignment:.topLeading){
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing:15){
                    ForEach(self.getEmoji(),id:\.self){emoji in
                        HStack(spacing:15){
                        ForEach(emoji, id: \.self){j in
                            Button {
                                self.userText += String(UnicodeScalar(j)!)                             } label: {
                                if (UnicodeScalar(j)?.properties.isEmoji)!{
                                    Text(String(UnicodeScalar(j)!)).font(.system(size:55))
                                }else{
                                    Text("")
                                }
                            }
                         }
                        }
                    }
                }
            }
                .frame(width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height/3)
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .background(Color.white)
                .cornerRadius(25)
            Button {
                self.show.toggle()
            } label: {
               Text("")
            }

        }
    }
    func getEmoji()->[[Int]]{
        var emojiArray : [[Int]] = []
        
        for emojiCodes in stride(from:0x1F601, to: 0x1F64F, by: 4){
            var temp :[Int] = []
            for j in emojiCodes...emojiCodes+3{
                
                temp.append(j)
            }
            emojiArray.append(temp)
        }
       return emojiArray
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

