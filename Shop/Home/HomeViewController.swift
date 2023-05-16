//
//  HomeViewController.swift
//  Shop
//
//  Created by Minaya Yagubova on 15.05.23.

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var search: UISearchBar!
    @IBOutlet private weak var collection: UICollectionView!
    
    var productItems = [Items]()
    let homeCell = "\(HomeCell.self)"
    private var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getItems()
        configViewModel()
        //configUI()
    }
    
    override func viewDidLayoutSubviews() {
        collection.register(UINib(nibName: homeCell, bundle: nil), forCellWithReuseIdentifier: homeCell)
    }
    
    func configViewModel() {
        viewModel.getItems()
        viewModel.successCallBack = {
            self.collection.reloadData()
        }
        viewModel.errorCallBack = { message in
            //error message or alert
        }
    }
    func configUI() {
       collection.reloadData()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.configure(data: viewModel.items[indexPath.item])
        return cell
    }
}
