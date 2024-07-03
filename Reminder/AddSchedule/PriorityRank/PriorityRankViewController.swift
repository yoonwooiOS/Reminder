//
//  PriorityRankViewController.swift
//  Reminder
//
//  Created by 김윤우 on 7/4/24.
//

import UIKit

class PriorityRankViewController: BaseViewController {
    let rankTextField = {
        let view = UITextField()
        view.addLeftPadding()
        view.keyboardType = .numberPad
        view.placeholder = "우선 순위 적어주세요"
        return view
    }()
    let doneButton = {
        let view = UIButton()
        view.setTitle("확인", for: .normal)
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        view.setTitleColor(.systemGreen, for: .normal)
        return view
    }()
    var userRank: ((String) -> Void)?
    override func viewWillDisappear(_ animated: Bool) {
        print(#function,"rank")
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        print(#function)
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButton()
    }
    override func setUpHierarchy() {
        view.addSubview(rankTextField)
        view.addSubview(doneButton)
    }
    override func setUpLayout() {
        doneButton.snp.makeConstraints { make in
            make.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(8)
        }
        rankTextField.snp.makeConstraints { make in
            make.top.equalTo(doneButton.snp.bottom).offset(40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
    }
    func setUpButton() {
        doneButton.addTarget(self, action: #selector(doneButtonClicked), for: .touchUpInside)
    }
    
    @objc func doneButtonClicked() {
        guard let rankText = rankTextField.text else { return }
        userRank?(rankText)
        dismiss(animated: true)
        
    }
}
