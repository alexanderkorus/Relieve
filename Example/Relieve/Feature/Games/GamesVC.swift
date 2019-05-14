//
//  GamesVC.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 15.05.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Relieve
import RxSwift
import RxCocoa
import RxDataSources

public final class GamesVC: UIViewController {

    // MARK: Delegate Properties
    private unowned let delegate: GamesVCDelegate

    // MARK: Initializers
    public init(delegate: GamesVCDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UIViewController Lifecycle Methods
    public override func loadView() {
        self.view = GamesView()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.configureNavigationBar(visibilty: true, title: "NBA Games", backgroundColor: UIColor.red)

        self.setUpTapRecognizer(with: [:])

        self.setUpTargetActions(with: [
            self.refreshControl: #selector(refresh)
        ])

        tableView.register(ExampleCell.self)

        configureRxDataSourceSections()

    }

    // MARK: RxDataSources
    let dataSource: RxTableViewSectionedReloadDataSource<ExampleSection> = RxTableViewSectionedReloadDataSource<ExampleSection>(
        configureCell: { (dataSource: TableViewSectionedDataSource<ExampleSection>, tableView: UITableView, indexPath: IndexPath, item: String) -> UITableViewCell in

            guard let cell: ExampleCell = tableView.getCell(ExampleCell.self, indexPath: indexPath) else { return UITableViewCell() }
            return cell
    })

    // MARK: Overridden UIKit Methods

    // MARK: Stored Properties
    private let disposeBag = DisposeBag()
    var exampleSections: PublishSubject<[ExampleSection]> = PublishSubject<[ExampleSection]>()

    // MARK: Computed Properties

    // MARK: Instance Methods


}

// MARK: - Views
private extension GamesVC {
    unowned var rootView: GamesView { return self.view as! GamesView }
    unowned var tableView: UITableView { return self.rootView.tableView }
    unowned var refreshControl: UIRefreshControl { return self.rootView.refreshControl }
}

// MARK: - Rx Setup
extension GamesVC {

    func configureRxDataSourceSections() {

        dataSource.titleForHeaderInSection = { dataSource, index in
            return dataSource.sectionModels[index].header
        }

        exampleSections
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }


}

// MARK: - Target Action Functions
private extension GamesVC {

    @objc func refresh() {
        // TODO: Call refresh delegate
    }

}
