//
//  ListVC.swift
//  Todolistapp
//
//  Created by Nail on 26.10.22.
//

import UIKit

class ListVC: UIViewController {

    @IBOutlet weak var table: UITableView!
    let viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    fileprivate func updateTableView(){
        viewModel.fetchData()
        table.reloadData()
    }
    @IBAction func addButtonTapped(_ sender: Any) {
        alertWihtTextField(with: "Add Item",
                           message: "",
                           actionButtonTitle: "Add",
                           cancelButtonTitle: "Cancel",
                           placeHolder: "Enter here") { text in
            if !text.isEmpty {
                self.viewModel.saveData(title: text)
                self.updateTableView()
            }
            
        }
    }
}
extension ListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.listArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        cell.textLabel?.text = viewModel.listArray[indexPath.row].title
        return cell
    }
}

extension ListVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            viewModel.deleteDate(index: indexPath.row)
            updateTableView()
        }
    }
}
