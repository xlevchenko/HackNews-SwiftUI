//
//  WebView.swift
//  Hack News
//
//  Created by Olexsii Levchenko on 17.10.2021.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
//We create a WebView from a UIKit component called WKWebView.
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
//Once the WKWebView is created, we will update it by loading the url, which should be displayed in our DetailView.
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
