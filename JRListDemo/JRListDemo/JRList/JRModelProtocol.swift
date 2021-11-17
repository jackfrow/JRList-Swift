//
//  JRListProtocol.swift
//  JRListDemo
//
//  Created by jackfrow on 2021/11/12.
//

import Foundation
import UIKit


protocol JRModelProtocol {
    
    var modelCellString:String { get }
    var modelHeigth:CGFloat { get }
    
}

extension JRModelProtocol{
    
    var modelCellString:String {
        return "\(type(of: self))"
    }
    
    var modelHeigth:CGFloat {
        return 44
    }
    
}


protocol JRUIAttach {
    func render(with row:JRModelProtocol)
   static func renderHeigeht() -> CGFloat 
}


protocol JRCellUIAttach:UITableViewCell,JRUIAttach {
    
}









