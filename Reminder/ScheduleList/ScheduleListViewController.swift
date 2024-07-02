//
//  ScheduleListViewController.swift
//  Reminder
//
//  Created by 김윤우 on 7/2/24.
//

import UIKit

final class ScheduleListViewController: BaseViewController {
    
    private let mainView = ScheduleListView()
    
    override func loadView() {
        view = mainView
    }
    
    
    override func setUpView() {
        
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(rightBarButtonItemClicked))
        rightBarButtonItem.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
    }
    @objc private func rightBarButtonItemClicked() {
        
        
    }
}
