//
//  ScheduleListView.swift
//  Reminder
//
//  Created by 김윤우 on 7/2/24.
//

import UIKit
import SnapKit

final class ScheduleListView: BaseView {
    
    let collectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout())
        
        return view
    }()
    static func layout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: <#T##Double#>, height: <#T##Double#>)
//        layout.scrollDirection = .vertical
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 0
//        layout.sectionInset = UIEdgeInsets(top: <#T##CGFloat#>, left: <#T##CGFloat#>, bottom: <#T##CGFloat#>, right: <#T##CGFloat#>)
        return layout
        
        
    }
    override func setUpHierarchy() {
        addSubview(collectionView)
    }
    override func setUpLayout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
    
}
