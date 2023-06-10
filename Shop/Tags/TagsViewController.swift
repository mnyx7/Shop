//
//  SecondCategoryViewController.swift
//  Shop
//
//  Created by Minaya Yagubova on 20.05.23.
//

import UIKit

class SecondCategoryViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    var productTags = [Tags]()
    
    private var viewModel = SecondCategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        configViewModel()
    }
    
    func configViewModel() {
        viewModel.getTags()
        viewModel.successCallBack = {
            self.table.reloadData()
        }
        viewModel.errorCallBack = { message in
            //error message or alert
        }
    }
    
    func configUI() {
        table.register(UINib(nibName: "leftLabelRightIconTableViewCell", bundle: nil), forCellReuseIdentifier: "leftLabelRightIconTableViewCell")
    }
}

extension SecondCategoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.tags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let xibCell = table.dequeueReusableCell(withIdentifier: "leftLabelRightIconTableViewCell", for: indexPath) as! leftLabelRightIconTableViewCell
        xibCell.configure(data: viewModel.tags[indexPath.item])
        return xibCell
    }
}
