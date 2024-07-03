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
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    let optionButton = {
        let view = UIButton()
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    let resultLabel = {
        let view = UILabel()
        view.text = ""
        view.textAlignment = .right
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
        addSubview(optionButton)
        addSubview(resultLabel)
        addSubview(chevronImageView)
    }
    override func setUpLayout() {
        baseUIView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide).inset(8)
        }
        optionButton.snp.makeConstraints { make in
            make.leading.equalTo(baseUIView.snp.leading).inset(8)
            make.verticalEdges.equalTo(baseUIView).inset(4)
        }
        chevronImageView.snp.makeConstraints { make in
            make.centerY.equalTo(baseUIView)
            make.trailing.equalTo(safeAreaLayoutGuide).inset(16)
            make.height.equalTo(safeAreaLayoutGuide).multipliedBy(1.1/3.5)
        }
        resultLabel.snp.makeConstraints { make in
            make.verticalEdges.equalTo(baseUIView).inset(4)
            make.trailing.equalTo(baseUIView.snp.trailing).inset(24)
        }
    }
    
}
