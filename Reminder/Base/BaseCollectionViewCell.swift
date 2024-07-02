//
//  BaseCollectionViewCell.swift
//  Reminder
//
//  Created by 김윤우 on 7/2/24.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        setUpHierarchy()
        setUpLayout()
        setUpView()
    }
    
    func setUpHierarchy() { }
    func setUpLayout() { }
    func setUpView() { }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

