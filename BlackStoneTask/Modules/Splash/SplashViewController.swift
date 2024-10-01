//
//  SplashViewController.swift
//  BlackStoneTask
//
//  Created by sameh mohammed on 30/09/2024.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        GoHome()
    }
    
    func GoHome() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
           // your function
            //        let mainView = UIViewController.loadFromNibNamed("WeatherHomeViewController")
//                    let homeVC = UIViewController(nibName: "WeatherHomeViewController", bundle: nil)
//                            //window?.addSubview(mainView!)
//                    self.rootViewController = homeVC
        }
    }
    
}
