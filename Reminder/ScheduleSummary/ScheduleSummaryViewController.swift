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
        view.tintColor = .black
        return view
    }()
   
    override func loadView() {
        view = mainView
    }
    override func viewWillAppear(_ animated: Bool) {
        print(#function,"메뉴")
        mainView.collectionView.reloadData()
        print(Date())
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
        navigationItem.backBarButtonItem?.tintColor = .black
        let blackBackButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        blackBackButton.tintColor = .black
        navigationItem.backBarButtonItem = blackBackButton
    }
    func setUpCollectionView() {
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
    }
    func setUpButton() {
        mainView.addNewTodoButton.addTarget(self, action: #selector(addNewTodoButtonClicked), for: .touchUpInside)
        
    }

    @objc func addNewTodoButtonClicked() {
        let vc = AddScheduleViewController()
        let nvc = UINavigationController(rootViewController: vc)
        vc.collectionViewReloadHandler = {
            self.mainView.collectionView.reloadData()
        }
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
        
        cell.setUpCell(data: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MemoListViewController()
        let data = ScheduleSummary.allCases[indexPath.row]
        vc.data = data
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
