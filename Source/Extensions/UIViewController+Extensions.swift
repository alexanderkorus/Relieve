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
                
                if let titleColor = titleColor {
                    navigationController?.navigationBar.titleTextAttributes = [
                        .foregroundColor: titleColor
                    ]
                }
            }
            
            if let backgroundColor = backgroundColor {
                self.navigationController?.navigationBar.barTintColor = backgroundColor
            }
            
            self.navigationController?.navigationBar.isTranslucent = false
        }
        
        self.navigationController?.setNavigationBarHidden(!visibilty, animated: false)
    }
    
    func alert(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    func alertWithActions(title: String, message: String, actions: [UIAlertAction]) {
        
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: UIAlertController.Style.alert)
        
        for action in actions {
            
            alertController.addAction(action)
            
        }
        
        self.present(alertController, animated: true, completion: nil)
        
    }

	/// Sets a logo to the navigation bar
	/// - Parameters:
	///   - image: the image which should be set to the navigation bar
	///   - offsets: the top offset and the bottom offset as tuple (top, bottom), default is (5.0, -5.0)
	func setNavigationBarLogo(image: UIImage?, offsets: (CGFloat, CGFloat) = (5.0,-5.0)) {

		guard let image = image
		else { return }

		let imageView = UIImageView(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: 10, height: 10))
		imageView.contentMode = .scaleAspectFit
		imageView.clipsToBounds = true
		imageView.image = image
		let contentView = UIView()
		contentView.addSubview(imageView)
		imageView.snp.remakeConstraints {
			$0.top.equalToSuperview().offset(offsets.0)
			$0.bottom.equalToSuperview().offset(offsets.1)
			$0.centerX.equalToSuperview()
			$0.centerY.equalToSuperview()
		}
		navigationItem.titleView = contentView
	}
}
