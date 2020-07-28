//
//  ViewController.swift
//  ToDo_iOS_app
//
//  Created by Sai Raghu Varma Kallepalli on 28/7/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//

import UIKit

class ToDoVC: UIViewController {
    
    @IBOutlet weak var todoText: UITextField!
    @IBOutlet weak var priortyControl: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onAddTapped(_ sender: Any) {
        print("tapped")
    }
    
}

