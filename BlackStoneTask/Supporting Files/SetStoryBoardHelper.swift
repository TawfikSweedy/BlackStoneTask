//
//  SetStoryBoardHelper.swift
//  BlackStoneTask
//
//  Created by  Tawfik Sweedy✌️ on 01/10/2024.
//

import Foundation
import UIKit


/// class for using storyBoard
class SetStoryBoard{
    
    /// function to return the UIViewcontroller depends on storyBoard name and VC name
    /// - Parameters:
    ///   - controller: structure contain controiller identifire and its storyboard
    ///   - story: storyBoard name
    /// - Returns: the view controller
    class func controller(controller: Helper) -> UIViewController{
        return UIStoryboard(name: controller.Story.rawValue, bundle: Bundle.main).instantiateViewController(withIdentifier: controller.VC.rawValue)
    }
    
    /// function to return the UIViewcontroller depends on storyBoard name and VC name
    /// - Parameters:
    ///   - controller: structure contain controiller identifire and its storyboard
    ///   - compilition: A closure to call
    ///   - controller: the view controller that get from closure
    class func controller(controller: Helper, compilition: (_ controller: UIViewController) -> Void){
        let storyBoard = UIStoryboard(name: controller.Story.rawValue, bundle: Bundle.main)
        let controller = storyBoard.instantiateViewController(withIdentifier: controller.VC.rawValue)
        compilition(controller)
    }
}


/// Control identifiers of controllers and storyboards
struct Helper{
    
    /// the story name in enum
    var Story: StoryBoards
    
    /// view controller name in enum
    var VC: ViewControllers
}

enum StoryBoards: String {
    case MainST = "Main"
}

enum ViewControllers: String {
    
    case WeatherHomeViewController = "WeatherHomeViewController"
}
