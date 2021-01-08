//
//  UserDetailView.swift
//  FriendlyFace
//
//  Created by Dave Spina on 1/7/21.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Text("Name: ")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(user.name)
                }
                HStack {
                    Text("Age: ")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(String(user.age))
                }
                HStack {
                    Text("Company: ")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(user.company)
                }
                HStack {
                    Image(systemName: "envelope")
                    Text(user.email)
                }
                HStack {
                    Image(systemName: "mail")
                    Text(user.address)
                }
                
                Section(header: Text("About").font(.headline)) {
                    Text(user.about)
                        .frame(width: 300)
                }.padding([.leading,.top])
                Section(header: Text("Tags").font(.headline)) {
                    List(user.tags, id: \.self) { tag in
                        Text(tag)
                    }
                }.padding([.leading, .top])
            }
            .padding()
            .navigationBarTitle(Text(user.name))
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let tags = ["tag1", "tag2", "tag3"]
        let friends: [Friend] = [Friend(id: UUID(), name: "Test Friend")]
        
        let user: User = User(id: UUID(), isActive: true, name: "Test User", age: 33, company: "ABC Company", email: "testuser@nowhere.net", address: "123 Anywhere Drive", about: "This is the name and details of the user", registered: Date(), tags: tags, friends: friends)
        UserDetailView(user: user)
    }
}