//
//  ProductSearchViewController.swift
//  Shop
//
//  Created by Minaya Yagubova on 09.06.23.
//

import UIKit

class ProductSearchViewController: UIViewController {
    var productList = [Products]()
    @IBOutlet weak var searchField: UITextField!
    var searchModel = SearchViewModel()
    private let cellId = "\(UIKitProductCollectionViewCell.self)"
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = .zero
        layout.sectionInset = UIEdgeInsets(top: 90, left: 0, bottom: 0, right: 0)
        //        layout.itemSize = CGSize(width: view.frame.size.width/2.2, height: view.frame.size.width/2.2)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        //collection.backgroundColor = .blue
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        collection.register(UIKitProductCollectionViewCell.nib(),
                            forCellWithReuseIdentifier: UIKitProductCollectionViewCell.identifier)
        return collection
    }()
    
    private var viewModel = ProductsViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        view.backgroundColor = .white
        configureConstraint()
        configViewModel()
        configreUI()
    }
    func configreUI() {
        collectionView.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    fileprivate func configureConstraint() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configViewModel() {
        viewModel.getProductItems()
        viewModel.successCallBack = {
            self.collectionView.reloadData()
        }
        viewModel.errorCallBack = { message in
            //error message or alert
        }
      
    }
    @IBAction func searchField(_ sender: Any) {
        if !(searchField.text?.isEmpty ?? false) {
            searchModel.getSearch(text: searchField.text ?? "")
        }
    }
    
}
extension ProductSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UIKitProductCollectionViewCell", for:  indexPath) as! UIKitProductCollectionViewCell
        cell.configure(data: viewModel.products[indexPath.item])
        //cell.backgroundColor = .orange
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2 - 5, height: 280)
    }
    
}
extension ProductSearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty ?? false {
            searchModel.resetDatas()
            collectionView.reloadData()
        }
        textField.resignFirstResponder()
        return true
    }
}
