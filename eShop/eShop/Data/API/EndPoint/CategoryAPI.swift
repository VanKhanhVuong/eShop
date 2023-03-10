//
//  CategoryAPI.swift
//  eShop
//
//  Created by Văn Khánh Vương on 25/12/2022.
//

import Alamofire

enum CategoryAPI {
    case getCategory
}

extension CategoryAPI: TargetType {
    var baseURL: String {
        "http://localhost/gumi/"
    }
    
    var headers: HTTPHeaders? {
        [
            "Content-Type" : "application/json"
        ]
    }
    
    var path: String {
        switch self {
        case .getCategory:
            return "get_all_category.php"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters? {
        switch self {
        case .getCategory:
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
