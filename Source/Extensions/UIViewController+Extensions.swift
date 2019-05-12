//
//  UIViewController+Extensions.swift
//  Relieve
//
//  Created by Alexander Korus on 12.05.19.
//

import UIKit.UIViewController

public extension UIViewController {
    
    /**
    Stored property which returns the top most view controller in the hierarchy
    */
    var topMostController: UIViewController? {
        get {
            var topController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController
            while ((topController?.presentedViewController) != nil) {
                topController = topController?.presentedViewController
            }
            return topController
        }
    }
 
    /**
     Set tap recognizers for the given views
     */
    func setUpTapRecognizer(with dict: [UIView: Selector]) {
        
        for (view, action) in dict {
            let viewTap = UITapGestureRecognizer(target: self, action: action)
            viewTap.numberOfTapsRequired = 1
            view.addGestureRecognizer(viewTap)
        }
    }
    
    /**
     Set target actions to the given UIControls
     */
    func setUpTargetActions(with dict: [UIControl: Selector]) {
        
        for (control, action) in dict {
            
            let controlEvent: UIControl.Event
            
            switch control {
                case is UISegmentedControl, is UIDatePicker, is UIRefreshControl, is UISwitch:
                    controlEvent = UIControl.Event.valueChanged
                default:
                    controlEvent = UIControl.Event.touchUpInside
            }
            
            control.addTarget(self, action: action, for: controlEvent)
            
        }
    }
    
    /**
    This function configures the navigation bar related to the passed values
    */
    func configureNavigationBar(
        visibilty: Bool,
        title: String? = nil,
        navigationBarImage: UIImage? = nil,
        backgroundColor: UIColor? = nil,
        titleColor: UIColor? = nil
    ) {
        
        if visibilty {
            if let navigationBarImage = navigationBarImage {
                let  imageView = UIImageView(image: navigationBarImage)
                imageView.contentMode = .scaleAspectFit
                imageView.clipsToBounds = false
                navigationItem.titleView = imageView
            } else if let title = title {
                navigationItem.title = title
                navigationController?.navigationBar.titleTextAttributes = [
                    .foregroundColor: titleColor ?? .black
                ]
            }
            
            self.navigationController?.navigationBar.barTintColor = backgroundColor
            
            self.navigationController?.navigationBar.isTranslucent = false
        }
        
        self.navigationController?.setNavigationBarHidden(!visibilty, animated: false)
    }
    
    
}
