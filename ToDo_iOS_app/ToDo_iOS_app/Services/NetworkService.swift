//
//  NetworkService.swift
//  ToDo_iOS_app
//
//  Created by Sai Raghu Varma Kallepalli on 28/7/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    
    let BASE_URL = "http://localhost:3003"
    let ADD = "/add"
    
    let session = URLSession(configuration: .default)
    
    
    func getToDos() {
        
        let url = URL(string: BASE_URL)
        
        let task = session.dataTask(with: url!) { (data, response, error) in
           debugPrint(data)
        }
        task.resume()
        
    }
    
    func addToDo(todo: ToDo) {
        
    }
    
    func deleteToDo(todo: ToDo) {
        
    }
}
