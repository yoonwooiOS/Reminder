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
    let reosigory = MemoTableRepository()
    var list: Results<MemoTable>!
    let realm = try! Realm()
    var data: ScheduleSummary?
    override func loadView() {
        view = mainView
    }
    override func viewWillAppear(_ animated: Bool) {
        mainView.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(data)
//        print(realm.configuration.fileURL)
       
        
        setUpNavitaionItem()
        setUpTableViewListData()
    }
    
    override func setUpTableView() {
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
    func setUpTableViewListData() {
        guard let data = data else { return }
        let realmData = realm.objects(MemoTable.self)
        switch data {
        case .today:
            list = realmData.where {
                let calendar = Calendar.current
                let startOfDay = calendar.startOfDay(for: Date())
                let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
                return $0.endDate >= startOfDay && $0.endDate < endOfDay && $0.iscomplete == false
            }
        case .expected:
            list = realmData.where {
                $0.endDate > Date() && $0.iscomplete == false
            }
        case .all, .flag:
            list = realmData.where {
                $0.iscomplete == false
            }
        case .complete:
           list = realmData.where {
                $0.iscomplete == true
            }
        }
        
    }
    
    func setUpNavitaionItem() {
        navigationItem.rightBarButtonItem = plusButton
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "전체"
    }
    @objc func rightBarButtonItemClicked() {
        let vc = AddScheduleViewController()
        let nvc = UINavigationController(rootViewController: vc)
        nvc.modalPresentationStyle = .fullScreen
        present(nvc, animated: true)
    }
}

extension MemoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainView.tableView.dequeueReusableCell(withIdentifier: MemoListTableViewCell.identifier, for: indexPath) as! MemoListTableViewCell
        let data = list[indexPath.row]
       
        cell.setUpCell(data: data)
        
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
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        return UISwipeActionsConfiguration()
    }
}

