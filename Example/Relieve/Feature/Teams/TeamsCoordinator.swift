//
//  TeamCoordinator.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 13.05.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Relieve

class TeamsCoordinator: AbstractCoordinator, TabCoordinator {
    
    // MARK: TabCoordinator Properties
    var viewController: UINavigationController
    let tabBarItem: UITabBarItem = UITabBarItem(title: "Teams", image: nil, selectedImage: nil)
    typealias ViewController = UINavigationController
    
    // MARK: Initializer
    init(navigationController: UINavigationController) {
        self.viewController = navigationController
        self.viewController.tabBarItem = self.tabBarItem
        super.init()
    }
    
    // MARK: Instance Methods
    override func start() {
        super.start()

        self.viewController.viewControllers = [
            TeamsVC(delegate: self)
        ]
    }
    
}

// MARK: - TeamVC Delegate Methods
extension TeamsCoordinator: TeamsVCDelegate {
    
    func onTeamClicked(team: Team) {
        
        let teamDetailCoordinator = TeamDetailCoordinator(
            team: team,
            viewController: viewController
        )
        
        teamDetailCoordinator.start()
        
    }

    func refresh(completion: (([ConferenceSection]?) -> Void)?) {
        
        BasketballService.getTeams(
            onSuccess: { (teams: [Team]) -> Void in
                
                // Filter possible sections
                var sections = teams
                    .map {
                        ConferenceSection(header: $0.conference, items: [])
                    }
                    .filterDuplicates { lhs, rhs in
                        lhs.header == rhs.header
                    }
                
                // Apply teams to sections
                for (index, section) in sections.enumerated() {
                    sections[index].items = teams.filter { $0.conference == section.header }
                }
                
                // pass sections back
                completion?(sections)

            },
            onFail: { (error: Error) -> Void in
                print(error)
                completion?(nil)
            }
        )
    }
    
}
