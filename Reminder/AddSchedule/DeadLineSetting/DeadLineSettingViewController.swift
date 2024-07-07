//
//  DeadLineSettingViewController.swift
//  Reminder
//
//  Created by 김윤우 on 7/3/24.
//

import UIKit
import SnapKit

final class DeadLineSettingViewController: BaseViewController {
    
    let datePicker = {
        let view = UIDatePicker()
        view.preferredDatePickerStyle = .inline
        view.datePickerMode = .date
        return view
    }()
    var selectedDate: Date?
    
    override func viewWillDisappear(_ animated: Bool) {
        guard let selectedDate = selectedDate else {
            print("선택되지 않음")
            return
        }
        NotificationCenter.default.post(name: NSNotification.Name("DateReceived"), object: nil, userInfo: ["DeadLineDate" :selectedDate])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPickerView()
    }
    override func setUpHierarchy() {
        view.addSubview(datePicker)
    }
    
    override func setUpLayout() {
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    func setUpPickerView() {
        datePicker.addTarget(self, action: #selector(dateClicked), for: .valueChanged)
    }
    @objc func dateClicked(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
//        let dateString = dateFormatter.string(from: sender.date)
        selectedDate = sender.date
    }
    @objc func doneButtonClicked() {
        guard let selectedDate = selectedDate else {
            return
        }
        NotificationCenter.default.post(name: NSNotification.Name("DateReceived"), object: nil, userInfo: ["DeadLineDate" :selectedDate])
        navigationController?.popViewController(animated: true)
        
    }
    
}
