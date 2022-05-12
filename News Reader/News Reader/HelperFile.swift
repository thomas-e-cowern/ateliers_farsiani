//
//  HelperFile.swift
//  News Reader
//
//  Created by Thomas Cowern New on 5/11/22.
//

import Foundation
import SwiftUI

class HelperFile: ObservableObject {
    
    let articlesUrlString = "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=91918a83b185469c9f81f5af74ae59f9"
    
    func getArticles () async {
    
        print("😍😍😍 Inside get articles")
        
        guard let url = URL(string: articlesUrlString) else {
            print("Invalid URL")
            return
        }
        
        do {
            print("😍😍😍 Inside do catch")
            let (data, _) = try await URLSession.shared.data(from: url)
            print("😍😍😍 Data: \(data)")
            debugPrint(data)
            if let decodedResponse = try? JSONDecoder().decode(Articles.self, from: data) {
                print(decodedResponse)
            } else {
                print("😡😡😡 Something went wrong decoding")
            }
            //
        } catch {
            print("Invalid Data")
        }
        
        
    }
}
