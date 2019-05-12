//
//  TeamVC.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 13.05.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Relieve

class TeamVC: UIViewController {
    
    // MARK: Delegate Properties
    private unowned let delegate: TeamVCDelegate
    
    // MARK: Initializer
    public init(delegate: TeamVCDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        self.view = TeamView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureNavigationBar(visibilty: true, title: "NBA Teams", backgroundColor: UIColor.red)
        
        self.setUpTapRecognizer(with: [:])
        
        self.setUpTargetActions(with: [:])
        
    }
    
}

// MARK: Views
extension TeamVC {
    unowned var rootView: TeamView { return self.view as! TeamView }
}

// MARK: Target Action Functions
extension TeamVC {
    
    // TODO: Implement target actions
    
}
