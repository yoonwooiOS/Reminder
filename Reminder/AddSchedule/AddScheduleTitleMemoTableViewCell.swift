//
//  AddScheduleTitleMemoTableViewCell.swift
//  Reminder
//
//  Created by 김윤우 on 7/2/24.
//

import UIKit
import SnapKit

class AddScheduleTitleMemoTableViewCell: BaseTableViewCell {
    
    let baseUIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        
        return view
    }()
    
    let dateTextField = {
        let view = UITextField()
        view.text = "마감일"
        view.addLeftPadding()
        return view
    }()
    let chevronImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "chevron.right")
        view.tintColor = .black
        return view
    }()
    override func setUpHierarchy() {
        addSubview(baseUIView)
        addSubview(dateTextField)
        addSubview(chevronImageView)
    }
    override func setUpLayout() {
        baseUIView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide).inset(8)
        }
        dateTextField.snp.makeConstraints { make in
            make.verticalEdges.leading.equalTo(baseUIView).inset(4)
        }
        chevronImageView.snp.makeConstraints { make in
            make.centerY.equalTo(baseUIView)
            make.trailing.equalTo(safeAreaLayoutGuide).inset(16)
            make.height.equalTo(safeAreaLayoutGuide).multipliedBy(1.1/3.5)
        }
    }
    
}
