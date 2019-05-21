//
//  TeamVC.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 13.05.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Relieve
import RxCocoa
import RxSwift
import RxDataSources

class TeamsVC: UIViewController {
    
    // MARK: - Delegate Properties
    private unowned let delegate: TeamsVCDelegate
    
    // MARK: - Initializer
    public init(delegate: TeamsVCDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        self.view = TeamsView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureNavigationBar(visibilty: true, title: "NBA Teams", backgroundColor: UIColor.red)
        
        self.setUpTapRecognizer(with: [:])
        
        self.setUpTargetActions(with: [
            self.refreshControl: #selector(refresh)
        ])
        
        tableView.register(TeamCell.self)
        
        configureRxDataSourceSections()
        
        self.refreshControl.beginRefreshing()
        self.refresh()
        
    }
    
    // MARK: - Stored Properties
    private let disposeBag = DisposeBag()
    var conferenceSections: PublishSubject<[ConferenceSection]> = PublishSubject<[ConferenceSection]>()
    
    // MARK: - Rx DataSources
    let dataSource: RxTableViewSectionedReloadDataSource<ConferenceSection> = RxTableViewSectionedReloadDataSource<ConferenceSection>(
        configureCell: { (dataSource: TableViewSectionedDataSource<ConferenceSection>, tableView: UITableView, indexPath: IndexPath, item: Team) -> UITableViewCell in
            
            guard let cell: TeamCell = tableView.getCell(TeamCell.self, indexPath: indexPath) else { return UITableViewCell() }
            cell.teamNameLabel.text = item.full_name
            return cell
    })

}

// MARK: - Views
extension TeamsVC {
    unowned var rootView: TeamsView { return self.view as! TeamsView }
    unowned var tableView: UITableView { return self.rootView.tableView }
    unowned var refreshControl: UIRefreshControl { return self.rootView.refreshControl }
}

// MARK: - Rx Setup
extension TeamsVC {
    
    func configureRxDataSourceSections() {
        
        dataSource.titleForHeaderInSection = { dataSource, index in
            return dataSource.sectionModels[index].header
        }
        
        conferenceSections
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Team.self)
            .subscribe(onNext: { team in
                self.delegate.onTeamClicked(team: team)
            })
            .disposed(by: disposeBag)
    }
    
    
}

// MARK: - Target Action Functions
extension TeamsVC {
    
    // TODO: Implement target actions
    @objc func refresh() {
        self.delegate.refresh() { (sections: [ConferenceSection]?) -> Void in
            sections?.let { (sections: [ConferenceSection]) in
                self.conferenceSections.onNext(sections)
            }
            self.refreshControl.endRefreshing()
        }
    }
    
}
