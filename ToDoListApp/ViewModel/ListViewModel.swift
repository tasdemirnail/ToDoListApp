//
//  ListViewModel.swift
//  Todolistapp
//
//  Created by Nail on 26.10.22.
//

import Foundation


class ListViewModel {
    
    var listArray = [List] ()
    
    let coreDataHelper = CoreDataHelper()
    
    func fetchData() {
    
        listArray = coreDataHelper.fetchData() ?? [List]()
    }
    
    func saveData(title : String){
        coreDataHelper.saveData(title: title)
    }
    
    func deleteDate (index : Int){
        coreDataHelper.deleteData(index: index)
        
    }
}
