//
//  DetailView.swift
//  Hack News
//
//  Created by Olexsii Levchenko on 16.10.2021.
//

import SwiftUI


struct DetailView: View {
    
    //DetailView ему передается строка URL, которая получает
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
        //WebView initialize our url constant to which the URL string is passed, which, used to create a WebView from a UIKit component, which is called WKWebView.
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "http://google.com/")
    }
}


