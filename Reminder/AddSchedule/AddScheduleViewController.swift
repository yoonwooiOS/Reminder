//
//  AddScheduleViewController.swift
//  Reminder
//
//  Created by 김윤우 on 7/2/24.
//

import UIKit
import RealmSwift

class AddScheduleViewController: BaseViewController {
    
    let mainView = AddScheduleView()
    lazy var cancelButton = {
        let view = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonClicked))
        view.tintColor = .black
        return view
    }()
    lazy var addButton = {
        let view =  UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(addButtonClicked))
        view.tintColor = .black
        return view
    }()
    
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationItem()
    }
    func setUpNavigationItem() {
        navigationItem.title = "새로운 할일"
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = addButton
       
   }
    override func setUpTableView() {
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
    override func showAlert(title: String, message: String, ok: String, handler: @escaping (() -> Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: ok, style: .default) { _ in
            handler()
        }
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
    
    @objc private func cancelButtonClicked() {
        dismiss(animated: true)
    }
    
    @objc private func addButtonClicked() {
        let realm = try! Realm()
        
        guard let title = mainView.titleTextField.text, let memo = mainView.memoTextView.text, !title.isEmpty else {
            showAlert(title: "제목을 입력해주세요!", message: "제목은 필수값입니다!", ok: "확인") {
            }
            return
        }
        let data = MemoTable(memoTitle: title, memo: memo, endDate: nil, hashTag: nil)
        try! realm.write {
            realm.add(data)
            dismiss(animated: true)
            print("리스트에 추가 됨")
        }
        
    }
}


extension AddScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainView.tableView.dequeueReusableCell(withIdentifier: AddScheduleTitleMemoTableViewCell.identifier, for: indexPath) as! AddScheduleTitleMemoTableViewCell
        
        return cell
    }
    
}

