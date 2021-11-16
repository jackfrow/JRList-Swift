//
//  JRListViewController.swift
//  JRListDemo
//
//  Created by jackfrow on 2021/11/12.
//

import UIKit

typealias MapBlock = (_ cellClass:String)->(UITableViewCell.Type)

class JRListViewController: UIViewController {

    var style:UITableView.Style = .plain
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.tableView)
        self.view.backgroundColor = UIColor.white
        
        loadCellModelMapping()
    
    }
    
    func loadCellModelMapping()  {
        //implement by subclass.
        
    }

    
    // MARK: - lazy
    lazy var tableView: UITableView = {
        let tb = UITableView(frame: self.view.bounds, style: style)
        tb.dataSource = self
        tb.delegate = self
        return tb
    }()
    
    
    lazy var models: [JRModelProtocol] = {
        let models = [JRModelProtocol]()
        return models
    }()
    
    lazy var modelCellBlockMap: [String:MapBlock] = {
        let dic = [String:MapBlock]()
        return dic
    }()
    
    
   

}

// MARK: - UITableViewDelegate && UITableViewDataSource

extension JRListViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = modelAtIndePath(indexPath: indexPath)
        return model.modelHeigth
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = modelAtIndePath(indexPath: indexPath)
        let cellClass = mappedCellClassForModel(model: model)
        let reuseIdentifier = reuseIdentifierWithCellClass(cellClass: cellClass)
        
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)

        if cell == nil {
            cell = cellClass.init(style: .default , reuseIdentifier: reuseIdentifier)
        }
        
        if let cell = cell as? JRUIAttach{
            cell.render(with: model)
        }
    
        return cell!
    }
    
}


// MARK: - Help Method
extension JRListViewController{
 
   private func modelAtIndePath(indexPath:IndexPath) -> JRModelProtocol {
        
        if indexPath.row > self.models.count {
            fatalError("error model datas")
        }
        
        let model = self.models[indexPath.row]
        return model
    
    }
    
    private func mappedCellClassForModel(model:JRModelProtocol) -> UITableViewCell.Type{
        
        guard let block = self.modelCellBlockMap[model.modelCellString] else {
            fatalError("model not register \(model.modelCellString)")
        }
        return block(model.modelCellString)
        
    }
    
    
  private  func reuseIdentifierWithCellClass(cellClass:UITableViewCell.Type?) -> String  {
        
        guard let cls = cellClass else {
            fatalError("error class name \(String(describing: cellClass))")
        }
        
        return "\(type(of: cls))"
        
    }

    
}


// MARK: - API
extension JRListViewController{
 
    func register(modelClass:Any, cellClass:UITableViewCell.Type)  {
    
        register(modelClass: modelClass ) { _ in
            return cellClass
        }
    }
    
    func register(modelClass:Any,cellBlock:@escaping MapBlock)  {
        
        let key = "\(modelClass)"
        modelCellBlockMap[key] = cellBlock
        
    }
    
}