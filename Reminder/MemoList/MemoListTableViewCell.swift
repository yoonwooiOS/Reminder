//
//  MemoListTableViewCell.swift
//  Reminder
//
//  Created by 김윤우 on 7/2/24.
//

import UIKit
import RealmSwift

class MemoListTableViewCell: BaseTableViewCell {
    
    lazy var completeButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "circle"), for: .normal)
        view.tintColor = .systemGreen
        view.addTarget(self, action: #selector(completeButtonClicked), for: .touchUpInside)
        return view
    }()
    
    var memoTitleLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .left
        return view
    }()
    
    var memoLabel: UILabel = {
        let view = UILabel()
        view.textColor = .systemGray4
        view.font = UIFont.systemFont(ofSize: 12)
        view.textAlignment = .left
        return view
    }()
    
    var dateLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 12)
        view.textAlignment = .left
        return view
    }()
    
    var hashTageLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 12)
        return view
    }()
    var memoData: MemoTable?
    var isCompleted = false
    override func setUpHierarchy() {
        [completeButton, memoTitleLabel, memoLabel, dateLabel, hashTageLabel].forEach {
            self.addSubview($0)
        }
    }
    override func setUpLayout() {
        completeButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(40)
        }
        
        memoTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(completeButton.snp.trailing).offset(12)
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
        isCompleted = data.iscomplete
        memoData = data
        memoTitleLabel.text = (data.priority ?? "") + data.memoTitle
        memoLabel.text =  data.memo
        dateLabel.text = data.endDate?.dateToString()
        hashTageLabel.text = data.hashTag
        let completedImage = data.iscomplete ? "checkmark.circle.fill" : "circle"
        completeButton.setImage(UIImage(systemName: completedImage), for: .normal)
        
    }
    @objc func completeButtonClicked() {
        guard let memo = memoData else {
            print("memoData is nil")
            return
        }
        isCompleted.toggle()
        
        let imageName = isCompleted ? "checkmark.circle.fill" : "circle"
        completeButton.setImage(UIImage(systemName: imageName), for: .normal)
        
        let realm = try! Realm()
        try! realm.write {
            memo.iscomplete = isCompleted
            realm.add(memo, update: .modified)
        }
    }
}
