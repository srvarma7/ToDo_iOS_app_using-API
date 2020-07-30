//
//  ToDoCell.swift
//  ToDo_iOS_app
//
//  Created by Sai Raghu Varma Kallepalli on 28/7/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    
    func updateCell(label: String, priority: Int) {
        
        todoLabel.text = label
        switch priority {
        case 0:
                colorView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
                break
        case 1:
                colorView.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
                break
        case 2:
                colorView.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
                break
        default:
            colorView.backgroundColor = .black
                debugPrint("Invalid priority found \(priority)")
        }
        
    }

}
