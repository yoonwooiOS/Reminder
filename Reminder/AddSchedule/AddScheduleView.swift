//
//  AddScheduleView.swift
//  Reminder
//
//  Created by 김윤우 on 7/2/24.
//

import UIKit
import SnapKit

 class AddScheduleView: BaseView {
    
     let textFiedUI = {
         let view = UIView()
         view.backgroundColor = .systemGray4
         view.clipsToBounds = true
         view.layer.cornerRadius = 12
         
         return view
     }()
     
      let titleTextField = {
          let view = UITextField()
          view.placeholder = "제목"
          return view
      }()
      
      let memoTextView = {
          let view = UITextView()
          view.backgroundColor = .systemGray4
          view.text = "메모"
          view.font = UIFont.systemFont(ofSize: 16)
          view.textColor = .systemGray
          return view
      }()
     
     let textFieldSeperator = {
         let view = UIView()
         view.backgroundColor = .darkGray
         return view
     }()
     
    let tableView = {
        let view = UITableView()
        view.separatorStyle = .none
        view.register(AddScheduleTitleMemoTableViewCell.self, forCellReuseIdentifier: AddScheduleTitleMemoTableViewCell.identifier)
        view.rowHeight = 60
        return view
    }()
    
    override func setUpHierarchy() {
        addSubview(textFiedUI)
        addSubview(titleTextField)
        addSubview(textFieldSeperator)
        addSubview(memoTextView)
        addSubview(tableView)
    }
    override func setUpLayout() {
        textFiedUI.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(8)
            make.height.equalTo(200)
        }
        titleTextField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(textFiedUI).inset(12)
            make.height.equalTo(52)
        }
        
        textFieldSeperator.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(textFiedUI).inset(12)
            make.height.equalTo(1)
        }
        
        memoTextView.snp.makeConstraints { make in
            make.top.equalTo(textFieldSeperator.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(textFiedUI).inset(12)
            make.bottom.equalTo(textFiedUI.snp.bottom).inset(8)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(textFiedUI.snp.bottom).offset(4)
            make.bottom.horizontalEdges.equalTo(safeAreaLayoutGuide)
        }
    }
    
   
}
