//
//  Loading.swift
//  BlackStoneTask
//
//  Created by Tawfik Sweedy✌️ .
//


import UIKit
import Lottie

class Loading: NSObject {
    static var overlayView: UIView!
    static var animationView: LottieAnimationView?
    
    static func dismissLoading(){
         DispatchQueue.main.async{
            animationView?.stop()
            animationView?.removeFromSuperview()
            guard overlayView != nil else {return}
            overlayView.removeFromSuperview()
        }
    }
 
    static func showLoading(_ view:UIView){
        dismissLoading()
        DispatchQueue.main.async{
            overlayView = UIView(frame: UIScreen.main.bounds)
            overlayView.tag = 24111994
            overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            view.addSubview(overlayView)
            animationView = .init(name: "loader")
            animationView!.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
            animationView?.center = overlayView.center
            animationView!.contentMode = .scaleAspectFit
            animationView!.loopMode = .loop
            animationView!.animationSpeed = 1
            overlayView.addSubview(animationView!)
            animationView!.play()
        }
    }

}


