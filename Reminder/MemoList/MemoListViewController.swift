//
//  MemoListViewController.swift
//  Reminder
//
//  Created by 김윤우 on 7/2/24.
//

import UIKit
import RealmSwift

class MemoListViewController: BaseViewController {
    
    let mainView = MemoListView()
    lazy var plusButton = {
        let view = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(self.rightBarButtonItemClicked))
        view.tintColor = .black
        return view
    }()
    var list: Results<MemoTable>!
    let realm = try! Realm()
    
    override func loadView() {
        view = mainView
    }
    override func viewWillAppear(_ animated: Bool) {
        mainView.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        list = realm.objects(MemoTable.self)
        setUpNavitaionItem()
    }
    
    override func setUpTableView() {
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
    
    func setUpNavitaionItem() {
        navigationItem.rightBarButtonItem = plusButton
    }
    @objc func rightBarButtonItemClicked() {
        let vc = AddScheduleViewController()
        let nvc = UINavigationController(rootViewController: vc)
        nvc.modalPresentationStyle = .fullScreen
        present(nvc, animated: true)
    }
}

extension MemoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainView.tableView.dequeueReusableCell(withIdentifier: MemoListTableViewCell.identifier, for: indexPath) as! MemoListTableViewCell
        let data = list[indexPath.row]
        cell.memoTitleLabel.text = data.memoTitle
        cell.memoLabel.text = data.memo
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let darkGraySquare = UIContextualAction(style: .normal, title: "") { _, _, _ in
            
        }
        
        let yellowSquare = UIContextualAction(style: .normal, title: "") { _, _, _ in
            
        }
        
        let delete = UIContextualAction(style: .normal, title: nil) { action, view, complitionHandler in
            try! self.realm.write {
                self.realm.delete(self.list[indexPath.row])
            }
            self.mainView.tableView.reloadData()
        }
        darkGraySquare.backgroundColor = .darkGray
        yellowSquare.backgroundColor = .systemYellow
        delete.backgroundColor = .red
        delete.title = "삭제"
        return UISwipeActionsConfiguration(actions: [delete, darkGraySquare, yellowSquare])
    }
}

