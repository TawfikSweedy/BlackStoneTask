//
//  WeatherHomeRouter.swift
//  BlackStoneTask
//
//

import Foundation
import UIKit

class WeatherHomeRouter: WeatherHomeRouterProtocol {

    weak var VC: WeatherHomeViewProtocol?
    
    static func createModule() -> UIViewController{
        let view = SetStoryBoard.controller(controller: Helper(Story: .MainST , VC: .WeatherHomeViewController )) as! WeatherHomeViewController
        let interactor = WeatherHomeInteractor()
        let router = WeatherHomeRouter()
        let presenter = WeatherHomePresenter(view: view, router: router, interactor: interactor, error: view)
        presenter.view = view
        view.presenter = presenter
        interactor.presenter = presenter
        interactor.error = presenter
        router.VC = view
        return view
    }
    
    //MARK: - Navigate to
    
}
