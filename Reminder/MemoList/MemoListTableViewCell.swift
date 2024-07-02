//
//  MemoListTableViewCell.swift
//  Reminder
//
//  Created by 김윤우 on 7/2/24.
//

import UIKit

class MemoListTableViewCell: BaseTableViewCell {
    
    let circleImageView: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "circle"), for: .normal)
        return view
    }()
    
    var memoTitleLabel: UILabel = {
        let view = UILabel()
        view.text = "!!!"
        view.textColor = .systemGray4
        view.textAlignment = .left
        return view
    }()
    
    var memoLabel: UILabel = {
        let view = UILabel()
        view.text = "12321"
        view.textAlignment = .left
        return view
    }()
    
    var dateLabel: UILabel = {
        let view = UILabel()
        view.text = "2024"
        view.textAlignment = .left
        return view
    }()
    
    var hashTageLabel: UILabel = {
        let view = UILabel()
        view.text = "#"
        
        return view
    }()
    
    override func setUpHierarchy() {
        [circleImageView, memoTitleLabel, memoLabel, dateLabel, hashTageLabel].forEach {
            self.addSubview($0)
        }
    }
    override func setUpLayout() {
        circleImageView.snp.makeConstraints { make in
            make.centerY.equalTo(safeAreaLayoutGuide)
            make.leading.equalTo(safeAreaLayoutGuide).offset(16)
            make.width.height.equalTo(20)
        }
        
        memoTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(4)
            make.leading.equalTo(circleImageView.snp.trailing).offset(8)
            
            
        }
        
        memoLabel.snp.makeConstraints { make in
            make.top.equalTo(memoTitleLabel.snp.bottom).offset(4)
            make.leading.trailing.equalTo(memoTitleLabel)
           
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(memoLabel.snp.bottom).offset(4)
            make.leading.trailing.equalTo(memoLabel)
            
        }
        
        hashTageLabel.snp.makeConstraints { make in
            make.top.equalTo(memoLabel.snp.bottom).offset(4)
            make.leading.equalTo(dateLabel.snp.trailing)
            make.bottom.equalToSuperview().offset(-8)
            
        }
    }
   
}
