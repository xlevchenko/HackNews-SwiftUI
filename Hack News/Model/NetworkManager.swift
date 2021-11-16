//
//  NetworkManager.swift
//  Hack News
//
//  Created by Olexsii Levchenko on 13.10.2021.
//

import Foundation

                       
class NetworkManager: ObservableObject {
    
    //We publish the property, and when the array has changes, @Published will notify all listeners.
    @Published var posts = [Post]()
    
    func fethData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                       let result = try decoder.decode(Result.self, from: safeData)
                            DispatchQueue.main.async { // add execution to the main thread
                                self.posts = result.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
            
        }
    }
}
