//
//  UIKitHeaderCollectionReusableView.swift
//  Shop
//
//  Created by Minaya Yagubova on 27.05.23.
//

import UIKit

class UIKitHeaderCollectionReusableView: UICollectionReusableView {
    
    let cellIdentifier = "\(FiltersCollectionViewCell.self)"
    static let identifier = "UIKitHeaderCollectionReusableView"
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = .zero
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(FiltersCollectionViewCell.nib(), forCellWithReuseIdentifier: cellIdentifier)
        return collection
    }()
    
    var tags = [Tags]()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configureConstraint() {
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(data: [Tags]) {
        tags = data
        collectionView.reloadData()
    }
}

extension UIKitHeaderCollectionReusableView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FiltersCollectionViewCell", for:  indexPath) as! FiltersCollectionViewCell
        cell.configure(data: tags[indexPath.item])        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 220, height: 60)
    }
}
