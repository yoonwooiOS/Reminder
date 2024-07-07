//
//  ScheduleSummaryCollectionViewCell.swift
//  Reminder
//
//  Created by 김윤우 on 7/4/24.
//
//TODO: RightBarButtonItem filter 구현
import UIKit
import SnapKit
import RealmSwift

class ScheduleSummaryCollectionViewCell: BaseCollectionViewCell {
    
    let imageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.tintColor = .white
        view.backgroundColor = .clear
        return view
    }()
    let backgroundImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemGreen
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    let rectangleUIView = {
        let view = UIView()
        view.clipsToBounds = true
        
        //        view.backgroundColor = .systemGray4
        return view
    }()
    var scheduleCountLabel = {
        let view = UILabel()
        view.text = "1"
        view.textColor = .white
        view.textAlignment = .right
        view.font = UIFont.boldSystemFont(ofSize: 32)
        //        view.backgroundColor = .systemGreen
        return view
    }()
    let scheduleFilterName = {
        let view = UILabel()
        //        view.text = "오늘"
        //        view.backgroundColor = .systemRed
        return view
    }()
    
    let realm = try! Realm()
    lazy var tasks = self.realm.objects(MemoTable.self)
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemGray4
    }
    override func setUpHierarchy() {
        addSubview(backgroundImageView)
        addSubview(imageView)
        addSubview(rectangleUIView)
        addSubview(scheduleCountLabel)
        addSubview(scheduleFilterName)
    }
    override func setUpLayout() {
        backgroundImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).inset(8)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).inset(18)
            make.size.equalTo(40)
        }
        imageView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(backgroundImageView)
            make.size.equalTo(28)
        }
        scheduleCountLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).inset(8)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(16)
            make.size.equalTo(48)
        }
        scheduleFilterName.snp.makeConstraints { make in
            make.top.equalTo(backgroundImageView.snp.bottom).offset(8)
            make.centerX.equalTo(backgroundImageView)
            
        }
    }
    func setUpCell(data: ScheduleSummary ) {
        
        switch data{
        case .today:
            let today = Date()
            print(Calendar.current.isDateInToday(today))
            let todayTasks = tasks.where {
                let calendar = Calendar.current
                let startOfDay = calendar.startOfDay(for: Date())
                print(startOfDay, "오늘")
                let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
                print(endOfDay, "내일")
                return $0.endDate >= startOfDay && $0.endDate < endOfDay && $0.iscomplete == false
            }.count
            scheduleFilterName.text = data.cellComponent[0]
            imageView.image =  UIImage(systemName: "\(data.cellComponent[1])")
            backgroundImageView.backgroundColor = .systemBlue
            scheduleCountLabel.text = "\(todayTasks)"

        case .expected:
            let expectedTasks = tasks.where {
                $0.endDate > Date() && $0.iscomplete == false
            }.sorted(byKeyPath: "endDate", ascending: true).count
            print(tasks)
            scheduleFilterName.text = data.cellComponent[0]
            imageView.image = UIImage(systemName: "\(data.cellComponent[1])")
            backgroundImageView.backgroundColor = .red
            scheduleCountLabel.text = "\(expectedTasks)"
        case .all:
            let allTasks = tasks.where {
                $0.iscomplete == false
            }.count
            scheduleFilterName.text = data.cellComponent[0]
            imageView.image = UIImage(systemName: "\(data.cellComponent[1])")
            backgroundImageView.backgroundColor = .darkGray
            scheduleCountLabel.text = "\(allTasks)"
        case .flag:
            scheduleFilterName.text = data.cellComponent[0]
            imageView.image = UIImage(systemName: "\(data.cellComponent[1])")
            backgroundImageView.backgroundColor = .systemYellow
            scheduleCountLabel.text = "\(tasks.count)"
        case .complete:
            let completed = tasks.where {
                $0.iscomplete == true
            }.count
            scheduleFilterName.text = data.cellComponent[0]
            imageView.image = UIImage(systemName: "\(data.cellComponent[1])")
            backgroundImageView.backgroundColor = .gray
            scheduleCountLabel.text = "\(completed)"
        }
    }
}
