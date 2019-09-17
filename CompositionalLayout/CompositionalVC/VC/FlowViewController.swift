//
//  ViewController.swift
//  CompositionalLayout
//
//  Created by 罗超 on 2019/9/16.
//  Copyright © 2019 罗超. All rights reserved.
//

import UIKit
import SnapKit

class FlowViewController: UIViewController {
    
    lazy var testCollectView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight];
//        collectionView.backgroundColor = UIColor.yellow
        collectionView.register(UINib(nibName: "NumCell", bundle: nil), forCellWithReuseIdentifier: "NumCell")
        collectionView.delegate = self
        collectionView.dataSource  = self
        return collectionView
    }()
    
    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        let spacing = CGFloat(10)
        group.interItemSpacing = .fixed(spacing)
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "title"
        self.view.addSubview(testCollectView)
        testCollectView.frame = self.view.bounds
        
        
        // Do any additional setup after loading the view.
    }
}

extension FlowViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NumCell", for: indexPath) as! NumCell
        cell.num = "\(indexPath.item)"
        
        return cell
        
    }
    
    
}

