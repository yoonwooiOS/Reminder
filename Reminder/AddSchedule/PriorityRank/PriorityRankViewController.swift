//
//  PriorityRankViewController.swift
//  Reminder
//
//  Created by 김윤우 on 7/4/24.
//

import UIKit

class PriorityRankViewController: BaseViewController {
    lazy var segmentControl = {
        
        let view = UISegmentedControl(items: [PriorityView.low.rawValue,
                                              PriorityView.middle.rawValue,
                                              PriorityView.hight.rawValue])
        
        view.addTarget(self, action: #selector(didChangedValue), for: .valueChanged)
        return view
    }()
    var userRank: ((String) -> Void)?
    var high: String?
    var middle: String?
    var low:String?
    override func viewWillDisappear(_ animated: Bool) {
        print(#function,"rank")
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        print(#function)
        
    }
    
    override func setUpHierarchy() {
        view.addSubview(segmentControl)
    }
    override func setUpLayout() {
        segmentControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
    }
    
    @objc func didChangedValue(_ sender: UISegmentedControl) {
      
        let selectedIndex = sender.selectedSegmentIndex
        let selectedPriorty = PriorityView.allCases[selectedIndex]
        userRank?(selectedPriorty.rawValue)
    }
}
