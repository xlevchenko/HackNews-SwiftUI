//
//  ContentView.swift
//  Hack News
//
//  Created by Olexsii Levchenko on 13.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager() //the variable acts as a listener of the class; subscribe to array updates from NetworkManager, using @ObservedObject
    
    var body: some View {
        
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }
            .navigationTitle("Hack News")
            .listStyle(GroupedListStyle()) //makes the fox full width of the screen
        }
        .onAppear {
            self.networkManager.fethData() //run the fetchData method and add the fetch data from the API to the List.
            
            
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




