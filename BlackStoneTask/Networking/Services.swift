//
//
//  Created by Tawfik Sweedy✌️  .
//


import Foundation
import Moya

enum Services {
    case Search(parameters : [String:Any])
    case ForeCast(parameters : [String:Any])
}
extension Services : URLRequestBuilder {
    var path: String {
        switch self {
        case .Search:
            return EndPoints.search.rawValue
        case .ForeCast:
            return EndPoints.foreCast.rawValue
        }
    }
    var method: Moya.Method {
        switch self {
        case .Search  , .ForeCast :
            return .get
      }
    }
    var sampleData: Data {
        return Data()
    }
    var task: Task {
        switch self {
        case .Search(let param) , .ForeCast(let param) :
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
        }
    }
}

