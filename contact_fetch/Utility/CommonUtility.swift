//
//  CommonUtility.swift
//  contact_fetch
//
//  Created by Yuvrajsinh on 11/11/22.
//

import Foundation
import UIKit

fileprivate var spinnerView: UIView?
//Common utility for loading indicator
extension UIViewController {
    
    // start the loading view
    func showSpiner() {
        spinnerView = UIView(frame: self.view.bounds)
        spinnerView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        let activity =  UIActivityIndicatorView(style: .medium)
        activity.center = spinnerView!.center
        activity.startAnimating()
        spinnerView?.addSubview(activity)
        self.view.addSubview(spinnerView!)
    }
    // stop loading view
    func hideSpiner() {
        spinnerView?.removeFromSuperview()
        spinnerView = nil
    }
}
