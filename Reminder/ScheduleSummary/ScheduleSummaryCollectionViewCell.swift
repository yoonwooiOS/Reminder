//
//  ScheduleSummaryCollectionViewCell.swift
//  Reminder
//
//  Created by 김윤우 on 7/4/24.
//

import UIKit
import SnapKit

class ScheduleSummaryCollectionViewCell: BaseCollectionViewCell {
    
    let imageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
//        view.backgroundColor = .systemBlue
        return view
    }()
    let rectangleUIView = {
        let view = UIView()
        view.clipsToBounds = true
    
//        view.backgroundColor = .systemGray4
        return view
    }()
    let scheduleCountLabel = {
        let view = UILabel()
        view.text = "1"
        view.textColor = .white
        view.textAlignment = .right
        view.font = UIFont.boldSystemFont(ofSize: 32)
//        view.backgroundColor = .systemGreen
        return view
    }()
    
    let scheduleFilterName = {
        let view = UILabel()
//        view.text = "오늘"
//        view.backgroundColor = .systemRed
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemGray4
    }
    override func setUpHierarchy() {
        addSubview(imageView)
        addSubview(rectangleUIView)
        addSubview(scheduleCountLabel)
        addSubview(scheduleFilterName)
    }
    override func setUpLayout() {
        imageView.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView.safeAreaLayoutGuide).inset(12)
            make.size.equalTo(48)
        }
        scheduleCountLabel.snp.makeConstraints { make in
            make.top.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(12)
            make.size.equalTo(48)
        }
        scheduleFilterName.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.centerX.equalTo(imageView)
            
        }
    }
}
