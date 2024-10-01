//
//  WeatherHomePresenter.swift
//  BlackStoneTask
//
//

import Foundation


class WeatherHomePresenter: WeatherHomePresenterProtocol, WeatherHomeInteractorOutputProtocol, ErrorProtocol {
    //MARK: - variables
    weak var view: WeatherHomeViewProtocol?
    var error: ErrorProtocol?
    var router: WeatherHomeRouterProtocol?
    var interactor: WeatherHomeInteractorInputProtocol?
    var ForeCastData : ForeCastModel?
//    //MARK: - init
    init(view: WeatherHomeViewProtocol,
         router: WeatherHomeRouterProtocol,
         interactor: WeatherHomeInteractorInputProtocol,
         error: ErrorProtocol){
        self.view = view
        self.router = router
        self.interactor = interactor
        self.error = error
    }
    //MARK: - functions
    func viewDidLoad() {
        interactor?.getForeCast(q: "Cairo")
    }
    
    func GetForeCastForCity(q: String) {
        interactor?.getForeCast(q: q)
    }
    
    func getCities(_ city : String) {
        interactor?.getCities(city)
    }
    
    func ReloadForeCasts() {
        print("Reload")
    }
    
    
    //MARK: - error deleagte functions
    func featching(error: String) {
        self.error?.featching(error: error)
    }
    
    func sessionExpired() {
        self.error?.sessionExpired?()
    }
    
    func noInternet() {
        self.error?.noInternet?()
    }

    
    func didForeCastsData(_ data: ForeCastModel) {
        self.ForeCastData = data
        self.view?.ShowForeCasts(data)
    }
    
    
    func didCitiesData(_ data: [searchModel]) {
        self.view?.ShowCities(data)
    }
    
}
