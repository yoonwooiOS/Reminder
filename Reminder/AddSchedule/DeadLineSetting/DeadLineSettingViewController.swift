//
//  DeadLineSettingViewController.swift
//  Reminder
//
//  Created by 김윤우 on 7/3/24.
//

import UIKit
import SnapKit

class DeadLineSettingViewController: BaseViewController {
    
    let datePicker = {
        let view = UIDatePicker()
        view.preferredDatePickerStyle = .inline
        view.datePickerMode = .date
        return view
    }()
    
    let dateLabel = {
        let view = UILabel()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        let dateString = dateFormatter.string(from: Date())
        view.text = dateString
        view.textAlignment = .left
        view.textColor = .black
        view.font = UIFont.boldSystemFont(ofSize: 20)
        return view
    }()
    
    let doneButton = {
        let view = UIButton()
        view.setTitle("확인", for: .normal)
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        view.setTitleColor(.systemGreen, for: .normal)
        return view
    }()
//    var deadLine: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPickerView()
        setUpButton()
    }
    override func setUpHierarchy() {
        view.addSubview(datePicker)
        view.addSubview(dateLabel)
        view.addSubview(doneButton)
    }
    
    override func setUpLayout() {
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom).offset(12)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        doneButton.snp.makeConstraints { make in
            make.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(8)
        }
    }
    func setUpPickerView() {
        datePicker.addTarget(self, action: #selector(dateClicked), for: .valueChanged)
        
    }
    func setUpButton() {
        doneButton.addTarget(self, action: #selector(doneButtonClicked), for: .touchUpInside)
        
    }
    @objc func dateClicked(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        let dateString = dateFormatter.string(from: sender.date)
        dateLabel.text = dateString
    }
    @objc func doneButtonClicked() {
        
        NotificationCenter.default.post(name: NSNotification.Name("DateReceived"), object: nil, userInfo: ["DeadLineDate" : dateLabel.text!])
        dismiss(animated: true)
        
    }
    
}
