//
//  ProductAPI.swift
//  eShop
//
//  Created by Văn Khánh Vương on 25/12/2022.
//

import Alamofire

enum ProductAPI{
    case getProduct
    case getProductByCategory(categoryId: String)
    case getProductByBrand(brandId: String)
    case getProductByName(productName: String)
}

extension ProductAPI: TargetType {
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
        case .getProduct:
            return "get_all_product.php"
        case .getProductByName:
            return "get_product_by_name.php"
        case .getProductByBrand:
            return "get_product_by_brandId.php"
        case .getProductByCategory:
            return "get_product_by_categoryId.php"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var parameters: Alamofire.Parameters? {
        switch self {
        case .getProductByName(let productName):
            return ["productName":productName]
        case .getProductByBrand(let brandId):
            return ["brandId":brandId]
        case .getProductByCategory(let categoryId):
            return ["categoryId":categoryId]
        case .getProduct:
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

