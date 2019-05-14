//___FILEHEADER___

import UIKit
import Relieve
import RxSwift
import RxCocoa
import RxDataSources

public final class ___FILEBASENAMEASIDENTIFIER___: JAViewController {

    // MARK: Delegate Properties
    private unowned let delegate: ___VARIABLE_productName:identifier___VCDelegate

    // MARK: Initializers
    public init(delegate: ___VARIABLE_productName:identifier___VCDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UIViewController Lifecycle Methods
    public override func loadView() {
        self.view = ___VARIABLE_productName:identifier___View()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.configureNavigationBar(visibilty: true, title: "", backgroundColor: UIColor.white)

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
private extension ___FILEBASENAMEASIDENTIFIER___ {
    unowned var rootView: ___VARIABLE_productName:identifier___View { return self.view as! ___VARIABLE_productName:identifier___View } // swiftlint:disable:this force_cast
    unowned var tableView: UITableView { return self.rootView.tableView }
    unowned var refreshControl: UIRefreshControl { return self.rootView.refreshControl }
}

// MARK: - Rx Setup
extension ___FILEBASENAMEASIDENTIFIER___ {

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
private extension ___FILEBASENAMEASIDENTIFIER___ {

    @objc func refresh() {
        // TODO: Call refresh delegate
    }

}
