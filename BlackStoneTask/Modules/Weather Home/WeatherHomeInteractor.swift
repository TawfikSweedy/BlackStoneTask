//
//  WeatherHomeInteractor.swift
//  BlackStoneTask
//
//

import Foundation
import Moya
import PromiseKit

class WeatherHomeInteractor: WeatherHomeInteractorInputProtocol {
    
    //MARK: - variables
    weak var presenter: WeatherHomeInteractorOutputProtocol?
    var error: ErrorProtocol?
//    var notifcationWorker: NotificationWorkerProtocol?
//    var walletWorker:WalletWorker?
    // MARK: - private valriables
    private let mainServices = MoyaProvider<Services>()
    
    
    func getForeCast(q : String){
        let params : [String : Any] =
            [
                "key"        : "88a5e84dae58425892f153841243009" ,
                "q"          : q ,
                "days"       : 5 ,
                "aqi"        : "yes" ,
                "alerts"     : "yes"
        ]
        print(params)
        firstly { () -> Promise<Any> in
//            Loading.showLoading(view)
            return BGServicesManager.CallApi(self.mainServices,Services.ForeCast(parameters: params))
        }.done({ response in
            let result = response as! Response
            let data : ForeCastModel = try BGDecoder.decode(data: result.data)
            self.presenter?.didForeCastsData(data)
            print(data)
        }).ensure {
            Loading.dismissLoading()
        }.catch { (error) in
            print(error)
            self.error?.featching(error: error.localizedDescription)
        }
    }
    
    func getCities(_ city : String){
        let params : [String : Any] =
            [
                "key"        : "88a5e84dae58425892f153841243009" ,
                "q"          : city
        ]
        print(params)
        firstly { () -> Promise<Any> in
//            Loading.showLoading(view)
            return BGServicesManager.CallApi(self.mainServices,Services.Search(parameters: params))
        }.done({ response in
            let result = response as! Response
            let data : [searchModel] = try BGDecoder.decode(data: result.data)
            self.presenter?.didCitiesData(data)
        }).ensure {
            Loading.dismissLoading()
        }.catch { (error) in
            print(error)
            self.error?.featching(error: error.localizedDescription)
        }
    }
    
}
