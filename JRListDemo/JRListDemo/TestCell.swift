//
//  TestCell.swift
//  JRListDemo
//
//  Created by jackfrow on 2021/11/16.
//

import UIKit

class TestCell: UITableViewCell,JRCellUIAttach {
    
    
    static func renderHeigeht() -> CGFloat {
        return 100
    }
    

    func render(with row: JRModelProtocol) {
        if let row = row as? TestModel{
            self.textLabel?.text = row.title
        }
        
    }
    

}
