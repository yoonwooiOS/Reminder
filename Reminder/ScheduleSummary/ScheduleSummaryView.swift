//
//  ScheduleSummaryView.swift
//  Reminder
//
//  Created by 김윤우 on 7/4/24.
//

import UIKit
import SnapKit

class ScheduleSummaryView: BaseView {
//    let footerLabel = {
//        let view = UILabel()
//        view.text = "전체"
//        view.textColor = .systemGray5
//        view.textAlignment = .left
//        view.font = UIFont.boldSystemFont(ofSize: 28)
//        
//        return view
//    }()
    let collectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: ScheduleSummaryView.layout())

        view.register(ScheduleSummaryCollectionViewCell.self, forCellWithReuseIdentifier: ScheduleSummaryCollectionViewCell.identifier)
        return view
    }()
    
    static func layout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 3 )
        layout.itemSize = CGSize(width: width / 2 , height: width / 4)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.scrollDirection = .vertical
        return layout
        
    }
    let addNewTodoButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        view.setTitle("새로운 할일", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.tintColor = .systemGreen
        var config = UIButton.Configuration.plain()
        config.imagePlacement = .leading
        config.imagePadding = 10
       
        view.configuration = config
        return view
    }()
    
    let addScheduleSummaryListButton = {
        let view = UIButton()
        view.setTitle("목록 추가", for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    
    override func setUpHierarchy() {
//       addSubview(footerLabel)
       addSubview(collectionView)
       addSubview(addNewTodoButton)
       addSubview(addScheduleSummaryListButton)
    }
    override func setUpView() {
//        footerLabel.snp.makeConstraints { make in
//            make.top.leading.equalTo(safeAreaLayoutGuide).inset(12)
//            make.height.equalTo(30)
//        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(16)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(60)
        }
        addNewTodoButton.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(12)
            make.leading.equalTo(safeAreaLayoutGuide).offset(12)
            make.height.equalTo(40)
        }
        addScheduleSummaryListButton.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(16)
            make.trailing.equalTo(safeAreaLayoutGuide).inset(12)
            make.height.equalTo(30)
        }
        
    }
    
}
