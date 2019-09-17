//
//  CompositionalViewController.swift
//  CompositionalLayout
//
//  Created by 罗超 on 2019/9/17.
//  Copyright © 2019 罗超. All rights reserved.
//

import UIKit

class CompositionalViewController: FlowViewController {
    
    override func createLayout() -> UICollectionViewLayout {
        
        let leadingItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.68), heightDimension: .fractionalHeight(1.0))
        let leadingItem = NSCollectionLayoutItem(layoutSize: leadingItemSize)
        leadingItem.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let trailingItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5))
        let trailingItem = NSCollectionLayoutItem(layoutSize: trailingItemSize)
        trailingItem.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let vGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.32), heightDimension: .fractionalHeight(1.0))
        let vGroup = NSCollectionLayoutGroup.vertical(layoutSize: vGroupSize, subitem: trailingItem, count: 2)
        
        let hGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let hGroup = NSCollectionLayoutGroup.horizontal(layoutSize: hGroupSize, subitems: [leadingItem, vGroup])
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalWidth(0.6))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [hGroup])
         
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        
        return layout
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CompositionalViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
}
