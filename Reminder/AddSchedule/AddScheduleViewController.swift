//
//  AddScheduleViewController.swift
//  Reminder
//
//  Created by 김윤우 on 7/2/24.
//

import UIKit
import RealmSwift
import PhotosUI

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
    
    
    var selectedDeadLineDate: Date?
    var userTag: String?
    var userPriorityRank: String?
    var userSelectedImage: UIImage?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        print(#function, "add")
//        print(userSelectedImage)
//        print(selectedDeadLineDate)
        mainView.tableView.reloadData()
    }
    override func viewWillDisappear(_ animated: Bool) {
        print(#function, "scondView")
    }
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationItem()
      
    }
    // MARK: Notification
    @objc func deadLineDateReceivedNotification(notification: NSNotification) {
        if let value = notification.userInfo? ["DeadLineDate"] as? Date {
            selectedDeadLineDate = value
        }
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
    func selectImage() {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        let picker = PHPickerViewController(configuration: configuration)
        picker.isEditing = true
        picker.delegate = self
        present(picker, animated: true)
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
        let data = MemoTable(memoTitle: title, memo: memo, endDate: selectedDeadLineDate?.toKST(), hashTag: userTag, priority: userPriorityRank)
        try! realm.write {
            realm.add(data)
            dismiss(animated: true)
            print("리스트에 추가 됨")
        }
        
    }
}


extension AddScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MemoOtions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainView.tableView.dequeueReusableCell(withIdentifier: AddScheduleTitleMemoTableViewCell.identifier, for: indexPath) as! AddScheduleTitleMemoTableViewCell
       
        cell.optionButton.setTitle(MemoOtions.allCases[indexPath.row].buttonTitle, for: .normal)
        let option = MemoOtions.allCases[indexPath.row]
        switch option {
        case .deadline:
            guard let date = selectedDeadLineDate else { return cell}
            cell.resultLabel.text = date.dateToString()
            return cell
        case .tag:
            cell.resultLabel.text = userTag
            return cell
        case .priorityRank:
            cell.resultLabel.text = userPriorityRank
            return cell
        case .addImage:
            cell.resultLabel.text = ""
            cell.imageview.image = userSelectedImage
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 열거형 타입이라 비교 불가
        // let item = MemoOtions.allCases[indexPath.row]
        let option = MemoOtions.allCases[indexPath.row]
        switch option {
            // MARK: Notification
        case.deadline:
            let vc = DeadLineSettingViewController()
            NotificationCenter.default.addObserver(self, selector: #selector(deadLineDateReceivedNotification), name: NSNotification.Name("DateReceived"), object: nil)
            navigationController?.pushViewController(vc, animated: true)
            return
            // MARK: Delegate
        case .tag:
            let vc = TagSettingViewController()
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)
            return
            // MARK: Closwure
        case .priorityRank:
            let vc = PriorityRankViewController()
            vc.userRank = { [weak self] value in
                self?.userPriorityRank = value
                self?.mainView.tableView.reloadData()
            }
            navigationController?.pushViewController(vc, animated: true)
            return
        case .addImage:
            selectImage()
            return
        }
    }
}

// MARK: Delegate
extension AddScheduleViewController: SendStringData {
    func sendData(myData: String) {
        print(#function)
        userTag = myData
        mainView.tableView.reloadData()
    }
}


extension AddScheduleViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        if let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            
            itemProvider.loadObject(ofClass: UIImage.self) { Image, error in
//                DispatchQueue.main.async {
                    self.userSelectedImage = Image as? UIImage
                //TODO: tableView reload시점 찾아야함
//                    print(self.userSelectedImage)
//                }
            }
        }
        
        dismiss(animated: true)
        
    }
    
    
}


