//
//  ThreeFlowViewController.swift
//  CompositionalLayout
//
//  Created by 罗超 on 2019/9/17.
//  Copyright © 2019 罗超. All rights reserved.
//

import UIKit

class ThreeFlowViewController: FlowViewController {

    enum sectionKind: Int, CaseIterable {
        case list, gird3, gird5
        
        func colCount(for width: CGFloat) -> Int {
            let wideMode = width > 800
            
            
            switch self {
            case .list:
                return wideMode ? 2: 1
            case .gird3:
                return wideMode ? 5: 3
            case .gird5:
                return wideMode ? 8: 5
            }
        }
        
        var colunmCount: Int {
            switch self {
            case .list:
                return 1
            case .gird3:
                return 3
            case .gird5:
                return 5
            }
        }
        
    }
    
    override func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout.init { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            
            print(sectionIndex)
            guard let kind = sectionKind(rawValue: sectionIndex) else {return nil}
            let col = kind.colCount(for: layoutEnvironment.container.effectiveContentSize.width)
            
            var groupHeight: NSCollectionLayoutDimension = .absolute(1)
            if layoutEnvironment.container.effectiveContentSize.width > 800 {
                groupHeight =  kind == .list ? .absolute(44) : .fractionalHeight(0.25)
            }else {
                groupHeight =  kind == .list ? .absolute(44) : .fractionalWidth(0.25)
            }
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: col)
            
            let spacing = CGFloat(10)
            group.interItemSpacing = .fixed(spacing)


            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 10
            section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
            
//            let background = NSCollectionLayoutDecorationItem.background(elementKind: "background")
//            section.decorationItems = [background]
            
//            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
//            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "header", alignment: .top)
//            
//            let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
//            let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: "footer", alignment: .bottom)
//            
//            
//            header.pinToVisibleBounds = true
//            footer.pinToVisibleBounds = true
//            
//            section.boundarySupplementaryItems = [header, footer]
            
            return section
        }
        
//        layout.register(<#T##viewClass: AnyClass?##AnyClass?#>, forDecorationViewOfKind: <#T##String#>)

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


extension ThreeFlowViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionKind.allCases.count
    }
    
    
    
}
