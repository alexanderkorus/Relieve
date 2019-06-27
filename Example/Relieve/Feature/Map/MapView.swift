//
//  MapView.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 27.06.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit
import Relieve
import MapKit

final class MapView: UIView {

    // MARK: Subviews
    let mapView: MKMapView = {
        let view = MKMapView()
        return view
    }()

    // MARK: Initializers
    public override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = .white

        // Setting up subviews
        self.rl.subviews(forAutoLayout: [
            self.mapView
        ])

        // Setting up constraints
        self.mapView.snp.remakeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.5)
        }
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
