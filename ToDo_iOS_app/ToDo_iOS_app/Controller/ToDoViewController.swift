//
//  ToDoViewController.swift
//  ToDo_iOS_app
//
//  Created by Sai Raghu Varma Kallepalli on 30/7/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController {

    @IBOutlet weak var todoText: UITextField!
    @IBOutlet weak var priortyControl: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    var todoItems = Array<ToDo>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
        getTodo()
    }
    
    func getTodo() {
        
        NetworkService.shared.getToDos(onSuccess: { (items) in
             self.todoItems = items.items
                       self.tableView.reloadData()
        }) { (error) in
            debugPrint(error)
        }
    }
    
    @IBAction func onAddTapped(_ sender: Any) {
        print("tapped")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ToDoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ToDoCell else { return ToDoCell() }
        cell.updateCell(label: todoItems[indexPath.row].item, priority: todoItems[indexPath.row].priority)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
