//
//  ViewController.swift
//  JRListDemo
//
//  Created by jackfrow on 2021/11/12.
//

import UIKit


fileprivate let width = 100

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let btn = UIButton(frame: CGRect(x: width, y: width, width: width, height: width))
        btn.setTitle("detail", for: .normal)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        btn.backgroundColor = UIColor.cyan
        self.view.addSubview(btn)
        
    }
    
    @objc func btnClick(){
        print("btnClick")
    }


}

