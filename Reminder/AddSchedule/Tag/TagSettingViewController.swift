//
//  TagSettingViewController.swift
//  Reminder
//
//  Created by 김윤우 on 7/3/24.
//

import UIKit
import SnapKit

protocol SendStringData {
    func sendData(myData: String)
}
class TagSettingViewController: BaseViewController {
    let tagTextField = {
        let view = UITextField()
        view.addLeftPadding()
        view.placeholder = "사용하실 태그를 입력해주세요."
        return view
    }()
    let doneButton = {
        let view = UIButton()
        view.setTitle("확인", for: .normal)
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        view.setTitleColor(.systemGreen, for: .normal)
        return view
    }()
    var userTag: ((String) -> Void)?
    override func viewDidDisappear(_ animated: Bool) {
        print(#function)
        
    }
    
    var delegate: SendStringData?
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.sendData(myData: tagTextField.text!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButton()
    }
    override func setUpHierarchy() {
        view.addSubview(tagTextField)
        view.addSubview(doneButton)
    }
    override func setUpLayout() {
        doneButton.snp.makeConstraints { make in
            make.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(8)
        }
        tagTextField.snp.makeConstraints { make in
            make.top.equalTo(doneButton.snp.bottom).offset(40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
    }
    func setUpButton() {
        doneButton.addTarget(self, action: #selector(doneButtonClicked), for: .touchUpInside)
    }
    
    @objc func doneButtonClicked() {
        delegate?.sendData(myData: tagTextField.text!)
        navigationController?.popViewController(animated: true)
        
    }
}
