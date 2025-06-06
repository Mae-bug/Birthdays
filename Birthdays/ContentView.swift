//
//  ContentView.swift
//  Birthdays
//
//  Created by Scholar on 6/6/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var newName = ""
    @State private var newBirthday = Date.now
    
    @State private var friends: [Friend] = [
        Friend(name: "Estelle Palleta", birthday: Date(timeIntervalSince1970: 1243382400.0)),
        Friend(name: "Hugh Mann", birthday: Date(timeIntervalSince1970: 1000000000))
    ]
    
    var body: some View {
        NavigationStack{
            List(friends, id: \.name) { friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
                
            }
            .navigationTitle(Text("Birthdays"))
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                    .font(.headline)
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        
                        if newName != "" {
                            friends.append(newFriend)
                            newName = ""
                            newBirthday = .now
                            }
                            }
                            .bold()
                }
                .padding()
                .background(.bar)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
