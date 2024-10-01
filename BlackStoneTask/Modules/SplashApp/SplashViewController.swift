//
//  SplashViewController.swift
//  BlackStoneTask
//
//  Created by  Tawfik Sweedy✌️ on 01/10/2024.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        GotoHome()
    }
    
   func GotoHome () {
       DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
           let vc = WeatherHomeRouter.createModule() as! WeatherHomeViewController
           vc.modalPresentationStyle = .fullScreen
           self.present(vc, animated: true)
       }
    }

}
