//
//  ContentView.swift
//  FriendlyFace
//
//  Created by Dave Spina on 1/7/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var users: [User] = [User]()
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(users, id: \.self) { user in
                        NavigationLink(
                            destination: UserDetailView(user: user, users: self.users),
                            label: {
                                Text(user.name)
                            })
                    }
                }.onAppear(perform: loadData)
            }.navigationBarTitle(Text("Friendly Face"))
        }
    }
    
    
    func loadData() {
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
                
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
