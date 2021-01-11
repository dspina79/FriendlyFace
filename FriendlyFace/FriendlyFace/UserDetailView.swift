//
//  UserDetailView.swift
//  FriendlyFace
//
//  Created by Dave Spina on 1/7/21.
//

import SwiftUI
import CoreData

struct UserDetailView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: CoreUser.entity(), sortDescriptors: []) var users: FetchedResults<CoreUser>
    
    var user: CoreUser
    
    var body: some View {
        NavigationView {
            ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text("Name: ")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(user.wrappedName)
                }
                HStack {
                    Text("Age: ")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(String(user.age))
                }
                HStack {
                    Text("Company: ")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(user.wrappedComany)
                }
                HStack {
                    Image(systemName: "envelope")
                    Text(user.wrappedEmail)
                }
                HStack {
                    Image(systemName: "mail")
                    Text(user.wrappedAddress)
                }
                
                Section(header: Text("About").font(.headline)) {
                    Text(user.wrappedAbout)
                        .frame(width: 300)
                }.padding([.leading,.top])
                Section(header: Text("Tags").font(.headline)) {
                    List(user.wrappedTags, id: \.self) { tag in
                        Text(tag)
                    }
                }.padding([.leading, .top])
                
                Section(header: Text("Friends").font(.headline)) {
                    List(user.wrappedFriends, id: \.self) { friend in
                        NavigationLink(
                            destination: UserDetailView(user: self.getUser(userId: friend.wrappedId)),
                            label: {
                                Text(friend.wrappedName)
                            })
                    }
                }.padding([.leading, .top])
                
            }
            .padding()
            .navigationBarTitle(Text(user.wrappedName))
        }
        }
    }
    
    
    func getUser(userId: UUID) -> CoreUser {
        let user = self.users.first(where: {$0.id == userId})
        return user ?? CoreUser()
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let tags = ["tag1", "tag2", "tag3"]
        let friends: [Friend] = [Friend(id: UUID(), name: "Test Friend")]
        
        let user: CoreUser = CoreUser()
        UserDetailView(user: user)
    }
}
