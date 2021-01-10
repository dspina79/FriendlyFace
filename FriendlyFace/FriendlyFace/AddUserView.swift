//
//  AddUserView.swift
//  FriendlyFace
//
//  Created by Dave Spina on 1/9/21.
//

import SwiftUI
import CoreData

struct AddUserView: View {
    @Environment(\.presentationMode) var presentationMode
    var moc: NSManagedObjectContext
    @State private var name: String = ""
    @State private var age: String = "0"
    @State private var company: String = ""
    @State private var email: String = ""
    @State private var address: String = ""
    @State private var about: String = ""
    
    @State private var errMessage: String = ""
    @State private var showError: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $name)
                    TextField("Age", text: $age)
                        .keyboardType(.numberPad)
                    TextField("Company", text: $company)
                    TextField("Email Address", text: $email)
                    TextField("Address", text: $address)
                    TextField("About", text: $about)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                }
                Section {
                    Button("Save") {
                        if isValid() {
                            saveData()
                            self.presentationMode.wrappedValue.dismiss()
                        } else {
                            self.errMessage = "The data provided is not valid. Please provide at least a correct name."
                            self.showError = true
                        }
                    }
                    
                    Button("Cancel") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationBarTitle(Text("New User"))
            .alert(isPresented: $showError) {
                Alert.init(title: "Data Error", message: errMessage, dismissButton: .default(Text("Ok")))
            }
        }
    }
    
    func saveData() {
        
    }
    
    func isValid() -> Bool {
        return !name.isEmpty
    }
}

struct AddUserView_Previews: PreviewProvider {
    static var previews: some View {
        AddUserView()
    }
}
