//
//  HomeViewController.swift
//  Shop
//
//  Created by Minaya Yagubova on 15.05.23.

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var collection: UICollectionView!
    
    let refreshController = UIRefreshControl()
    
    var productItems = [Items]()
    var categoriesList = [Categories]()
    let homeCell = "\(HomeCell.self)"
    private var viewModel = HomeViewModel()
    private var productVM = ProductsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        collection.register(UINib(nibName: homeCell, bundle: nil), forCellWithReuseIdentifier: homeCell)
        
        configViewModel()
        print(self.viewModel.categoryProductList.count)
        //configUI()
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
        
        refreshController.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        collection.refreshControl = refreshController
        
    }
    
    func configureViewModel() {
        refreshController.beginRefreshing()
        viewModel.getProductItems()
        viewModel.successCallBack = {
            self.collection.reloadData()
            self.refreshController.endRefreshing()
        }
        viewModel.errorCallBack = { message in
            print("people error: \(message)")
            self.refreshController.endRefreshing()
        }
    }
    
    @objc func pullToRefresh() {
        viewModel.reset()
        collection.reloadData()
        viewModel.getProductItems()
    }
    
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.categoryName.text = viewModel.categories[indexPath.item].categoryName
        
        //        if viewModel.categoryProductList.isEmpty {
        //            cell.productsList = viewModel.categoryProductList[indexPath.item].productByCatList
        //        }
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
        //burda filterlamaliyam id ile productlari
        
        //controller.productList = categoriesList[indexPath.item]
        navigationController?.show(controller, sender: nil)
    }
    
}
