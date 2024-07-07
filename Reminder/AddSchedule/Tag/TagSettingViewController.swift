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
    var userTag: ((String) -> Void)?
    override func viewDidDisappear(_ animated: Bool) {
        print(#function)
        
    }
    
    var delegate: SendStringData?
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.sendData(myData: tagTextField.text!)
    }
    override func setUpHierarchy() {
        view.addSubview(tagTextField)
        
    }
    override func setUpLayout() {

        tagTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
    }
}
