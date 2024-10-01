//
//  URLRequestBuilder.swift
//
//
//  Created by Tawfik Sweedy✌️  .
//

import Foundation
import Moya

// MARK: - using Moya pod
// for more info please check this url https://github.com/Moya/Moya
// read the doc. and enjoy
@available(iOS 13.0, *)
let appscene = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate

protocol URLRequestBuilder: TargetType {
    
    var baseURL: URL { get }
    
    var requestURL: URL { get }
    
    // MARK: - Path
    var path: String { get }
    
    var headers: [String: String]? { get }
    
    // MARK: - Methods
    var method: Moya.Method { get }
    
    var encoding: ParameterEncoding { get }
    
    var urlRequest: URLRequest { get }
    
    var deviceId: String { get }
}
// MARK: - application constants

extension URLRequestBuilder {
    // MARK: - BASE URL

    var baseURL: URL {
        return URL(string: BGConstants.apiURL)!
    }
    // MARK: - Request URL
    var requestURL: URL {
        return baseURL.appendingPathComponent(path)
    }
    // MARK: - application headers
    var headers: [String: String]? {
        let header = [String: String]()
        return header
    }
    
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        headers?.forEach { request.addValue($1, forHTTPHeaderField: $0) }
        return request
    }
    
    var deviceId: String {
        return UIDevice.current.identifierForVendor?.uuidString ?? ""
    }
    

    
}

