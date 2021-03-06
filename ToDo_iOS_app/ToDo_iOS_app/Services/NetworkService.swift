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
    
    
    func getToDos(onSuccess: @escaping (ToDos) -> Void, onError: @escaping (String) -> Void) {
        
        let url = URL(string: BASE_URL)
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            DispatchQueue.main.async {
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
                
                guard let data = data, let response = response as? HTTPURLResponse else {
                    onError("Invalid data or response")
                    return
                }
                do {
                    if response.statusCode == 200 {
                        //Parse the data
                        let items = try JSONDecoder().decode(ToDos.self, from: data)
                        onSuccess(items)
                    } else {
                        let apiError = try JSONDecoder().decode(APIError.self, from: data)
                        onError(apiError.message)
                    }
                } catch {
                    onError("Error while parising \(error.localizedDescription)")
                }
            }
        }
        task.resume()
        
    }
    
    func addToDo(todo: ToDo, onSuccess: @escaping (ToDos) -> Void, onError: @escaping (String) -> Void) {
        
        let url = URL(string: BASE_URL+ADD)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            let body = try JSONEncoder().encode(todo)
            request.httpBody = body
            
            let task = session.dataTask(with: request) { (data, response, error) in
                
                DispatchQueue.main.async {
                    if let error = error {
                        onError(error.localizedDescription)
                        return
                    }
                    
                    guard let data = data, let response = response as? HTTPURLResponse else {
                        onError("Invalid data or response")
                        return
                    }
                    do {
                        if response.statusCode == 200 {
                            //Parse the data
                            let items = try JSONDecoder().decode(ToDos.self, from: data)
                            onSuccess(items)
                        } else {
                            let apiError = try JSONDecoder().decode(APIError.self, from: data)
                            onError(apiError.message)
                        }
                    } catch {
                        onError("Error while parising \(error.localizedDescription)")
                    }
                }
            }
            task.resume()
        } catch {
            
        }
        
        
        
    }
    
    func deleteToDo(todo: ToDo) {
        
    }
}
