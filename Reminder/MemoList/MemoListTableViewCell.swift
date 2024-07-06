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
        view.font = UIFont.systemFont(ofSize: 12)
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
        view.font = UIFont.systemFont(ofSize: 12)
        view.textAlignment = .left
        return view
    }()
    
    var hashTageLabel: UILabel = {
        let view = UILabel()
        view.text = "#"
        view.font = UIFont.systemFont(ofSize: 12)
        return view
    }()
    
    override func setUpHierarchy() {
        [circleImageView, memoTitleLabel, memoLabel, dateLabel, hashTageLabel].forEach {
            self.addSubview($0)
        }
    }
    override func setUpLayout() {
        circleImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(40)
        }
        
        memoTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(circleImageView.snp.trailing).offset(12)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        memoLabel.snp.makeConstraints { make in
            make.top.equalTo(memoTitleLabel.snp.bottom)
            make.leading.trailing.equalTo(memoTitleLabel)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(memoLabel.snp.bottom)
            make.leading.equalTo(memoTitleLabel)
        }
        
        hashTageLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel)
            make.leading.equalTo(dateLabel.snp.trailing).offset(8)
            make.trailing.lessThanOrEqualTo(memoTitleLabel)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
    func setUpCell(data: MemoTable) {
        
        memoTitleLabel.text = data.memoTitle
        memoLabel.text =  (data.priority ?? "") + (data.memo ?? "")
        dateLabel.text = data.endDate?.dateToString()
        hashTageLabel.text = data.hashTag
        
    }
   
}
