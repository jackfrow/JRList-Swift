//
//  TestViewController.swift
//  JRListDemo
//
//  Created by jackfrow on 2021/11/16.
//

import UIKit

class TestViewController: JRListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
    }
    
    
    func loadData()  {
        
        for i in 0 ... 100 {
            let model = TestModel(title: "test \(i)")
            self.models.append(model)
        }
        
        self.tableView.reloadData()
        
    }
    
    
    // MARK: - API
    override func loadCellModelMapping() {
        
        self.register(modelClass:TestModel.self, cellClass: TestCell.self)
    
    }


}
