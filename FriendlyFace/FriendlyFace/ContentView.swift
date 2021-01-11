//
//  ContentView.swift
//  FriendlyFace
//
//  Created by Dave Spina on 1/7/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: CoreUser.entity(), sortDescriptors: []) var coreUsers: FetchedResults<CoreUser>
    
    @State private var users: [User] = [User]()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(coreUsers, id: \.self) { user in
                        NavigationLink(
                            destination: UserDetailView(user: user),
                            label: {
                                Text(user.wrappedName)
                            })
                    }
                }.onAppear(perform: loadData)
            }
            .navigationBarTitle(Text("Friendly Face"))
        }
    }
    
    func loadDataIntoCore() {
        print("Loading data into core...")
        for u in self.users {
            let cu = CoreUser(context: self.moc)
            print("About to set record...")
            cu.setrecord(from: u, with: self.moc)
        }
        
        if moc.hasChanges {
            try? self.moc.save()
        }
    }
    
    func loadFromWeb() {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("There was no data returned.")
                return
            }
            do {
            let decodedValue = try JSONDecoder().decode([User].self, from: data)
                    print("Assigning")
                    users = decodedValue
                    loadDataIntoCore()
                
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func loadData() {
        if coreUsers.isEmpty {
            // need to initially load from web
            print("Loading from web...")
            loadFromWeb()
        } else {
            print("Core data already loadded with records!")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
