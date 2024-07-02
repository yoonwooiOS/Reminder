//
//  MemoListView.swift
//  Reminder
//
//  Created by 김윤우 on 7/2/24.
//

import UIKit

class MemoListView: BaseView {
    
    let footerLabel = {
        let view = UILabel()
        view.text = "전체"
        view.textColor = .black
        view.textAlignment = .left
        view.font = UIFont.boldSystemFont(ofSize: 28)
        
        return view
    }()
    let tableView = {
        let view =  UITableView()
//        view.backgroundColor = .systemGreen
        view.register(MemoListTableViewCell.self, forCellReuseIdentifier: MemoListTableViewCell.identifier)
        view.rowHeight = 80
        return view
    }()
    
    override func setUpHierarchy() {
        addSubview(footerLabel)
        addSubview(tableView)
    }
    override func setUpLayout() {
        footerLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(safeAreaLayoutGuide).inset(12)
            make.height.equalTo(30)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(footerLabel.snp.bottom)
            make.bottom.horizontalEdges.equalTo(safeAreaLayoutGuide)
        }
    }
}
