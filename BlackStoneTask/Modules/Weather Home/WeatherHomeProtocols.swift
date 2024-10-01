//
//  WeatherHomeProtocols.swift
//  BlackStoneTask
//
//

import Foundation


protocol WeatherHomeViewProtocol: AnyObject {
    // TODO: Declare view methods
    var presenter: WeatherHomePresenterProtocol? { get }
    func ShowForeCasts(_ data: ForeCastModel)
    func ShowCities(_ data : [searchModel])
}

protocol WeatherHomePresenterProtocol: AnyObject {
    // TODO: Declare presentation methods
    var router: WeatherHomeRouterProtocol? { get }
    var view: WeatherHomeViewProtocol? { get }
    var interactor: WeatherHomeInteractorInputProtocol? { get }
    var ForeCastData : ForeCastModel? {get set}
    func viewDidLoad()
    func getCities(_ city : String)
    func ReloadForeCasts()
    func GetForeCastForCity(q : String)
}

protocol WeatherHomeInteractorInputProtocol {
    // TODO: Declare Interactor Input methods
    var presenter: WeatherHomeInteractorOutputProtocol? { get set }
    func getForeCast(q : String)
    func getCities(_ city : String)
}

protocol WeatherHomeInteractorOutputProtocol: AnyObject {
    // TODO: Declare Interactor Output methods
    func didForeCastsData(_ data: ForeCastModel)
    func didCitiesData(_ data : [searchModel])
}

protocol WeatherHomeRouterProtocol {
    // TODO: Declare wireframe methods
}
