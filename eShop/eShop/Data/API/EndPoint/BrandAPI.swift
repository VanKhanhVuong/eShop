//
//  BrandAPI.swift
//  eShop
//
//  Created by Văn Khánh Vương on 24/12/2022.
//

import Alamofire

enum BrandAPI {
    case getBrand
}

extension BrandAPI: TargetType {
    var baseURL: String {
        "http://localhost/gumi/"
    }
    
    var path: String {
        switch self {
        case .getBrand:
            return "get_all_brand.php"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var headers: HTTPHeaders? {
        [
            "Content-Type" : "application/json"
        ]
    }
    
    var parameters: Parameters? {
        switch self {
        case .getBrand:
            return [:]
        }
    }
    
    var url: URL? {
        guard let url = URL(string: self.baseURL + self.path) else { return nil }
        return url
    }
    
    var encoding: Alamofire.ParameterEncoding {
        return URLEncoding.default
    }
}

