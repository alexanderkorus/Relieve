//___FILEHEADER___

import UIKit
import Relieve

final class ExampleCell: UITableViewCell, RelieveTableViewCell {

    // MARK: - Subviews

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Setting up subviews
        self.rl.subviews(forAutoLayout: [])

        // Setting up Constraints

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public static var Identifier: String = "ExampleCellIdentifier"

}
