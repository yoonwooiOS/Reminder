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
    let dateLabel = {
        let label = UILabel()
        
        return label
    }()
    var selectedDate: Date?
    let viewModel = DeadLineViewModel()
    override func viewWillDisappear(_ animated: Bool) {
        guard let selectedDate = viewModel.inputCalenderDateClicked.value else {
            print("선택되지 않음")
            return
        }
        NotificationCenter.default.post(name: NSNotification.Name("DateReceived"), object: nil, userInfo: ["DeadLineDate" :selectedDate])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPickerView()
        bindData()
    }
    override func setUpHierarchy() {
        view.addSubview(datePicker)
        view.addSubview(dateLabel)
    }
    
    override func setUpLayout() {
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom).offset(12)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    func setUpPickerView() {
        datePicker.addTarget(self, action: #selector(dateClicked), for: .valueChanged)
    }
    func bindData() {
        viewModel.outPudText.bind { value in
            self.dateLabel.text = value
        }
    }
    @objc func dateClicked(_ sender: UIDatePicker) {
        viewModel.inputCalenderDateClicked.value = sender.date
    }
}
