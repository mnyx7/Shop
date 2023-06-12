//
//  HomeViewController.swift
//  Shop
//
//  Created by Minaya Yagubova on 15.05.23.

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var collection: UICollectionView!
    
    var productItems = [Items]()
    var categoriesList = [Categories]()
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
        viewModel.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.configure(data: viewModel.categories[indexPath.item])
        //cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collection.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        let controller = storyboard?.instantiateViewController(withIdentifier: "\(SecondCategoryViewController.self)") as! SecondCategoryViewController
        //        viewModel.categories[indexPath.item]
        let controller = ProductsViewController()
        //controller.productList = categoriesList[indexPath.item].id ?? []
        navigationController?.show(controller, sender: nil)
    }
    
}
