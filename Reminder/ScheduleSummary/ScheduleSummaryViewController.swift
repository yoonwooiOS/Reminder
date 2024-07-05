//
//  ScheduleSummaryViewController.swift
//  Reminder
//
//  Created by 김윤우 on 7/4/24.
//

import UIKit

class ScheduleSummaryViewController: BaseViewController {
    
    let mainView = ScheduleSummaryView()
    lazy var ellipsisButton = {
        let view = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: #selector(ellipsisButtonClicked))
        return view
    }()
   
    override func loadView() {
        view = mainView
    }
    override func viewWillAppear(_ animated: Bool) {
        print(#function,"메뉴")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationItem()
        setUpCollectionView()
        setUpButton()
    }
    func setUpNavigationItem() {
        navigationItem.rightBarButtonItem = ellipsisButton
        navigationItem.title = "전체"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    func setUpCollectionView() {
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
    }
    func setUpButton() {
        mainView.addNewTodoButton.addTarget(self, action: #selector(addNewTodoButtonClicked), for: .touchUpInside)
        
    }

    @objc func addNewTodoButtonClicked() {
        let nvc = UINavigationController(rootViewController: AddScheduleViewController())
        present(nvc, animated: true)
        
    }
    @objc func ellipsisButtonClicked() {
        
    
    }
}

extension ScheduleSummaryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ScheduleSummary.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainView.collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleSummaryCollectionViewCell.identifier, for: indexPath) as! ScheduleSummaryCollectionViewCell
        
        let data = ScheduleSummary.allCases[indexPath.row]
        
        switch data{
        case .today:
            cell.scheduleFilterName.text = data.cellComponent[0]
            cell.imageView.image = UIImage(systemName: data.cellComponent[1])
        case .expected:
            cell.scheduleFilterName.text = data.cellComponent[0]
            cell.imageView.image = UIImage(systemName: "\(data.cellComponent[1])")
        case .all:
            cell.scheduleFilterName.text = data.cellComponent[0]
            cell.imageView.image = UIImage(systemName: "\(data.cellComponent[1])")
        case .flag:
            cell.scheduleFilterName.text = data.cellComponent[0]
            cell.imageView.image = UIImage(systemName: "\(data.cellComponent[1])")
        case .complete:
            cell.scheduleFilterName.text = data.cellComponent[0]
            cell.imageView.image = UIImage(systemName: "\(data.cellComponent[1])")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MemoListViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
