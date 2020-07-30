//
//  Todo.swift
//  ToDo_iOS_app
//
//  Created by Sai Raghu Varma Kallepalli on 28/7/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//

import Foundation

struct ToDos: Codable {
    var items: [ToDo]
}

struct ToDo: Codable {
    var item: String
    var priority: Int
}

struct APIError: Codable {
    var message: String
}
