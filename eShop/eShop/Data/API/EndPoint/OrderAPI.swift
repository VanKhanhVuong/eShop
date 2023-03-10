//
//  OrderAPI.swift
//  eShop
//
//  Created by Văn Khánh Vương on 25/12/2022.
//

import Alamofire

enum OrderAPI {
    case createOrder(idOrder: String, delivery: String, pament: String, promoCode: String, idUser: String, totalBill: String)
}

extension OrderAPI: TargetType {
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
        case .createOrder:
            return "create_order.php"
        }
    }
    
    var httpMethod: HTTPMethod {
        return.get
    }
    
    var parameters: Parameters? {
        switch self {
        case .createOrder(let idOrder, let delivery, let pament, let promoCode, let idUser, let totalBill):
            return[
                "idOrder":idOrder,
                "delivery":delivery,
                "pament":pament,
                "promoCode":promoCode,
                "idUser":idUser,
                "totalBill":totalBill
            ]
        }
    }
    
    var url: URL? {
        guard let url = URL(string: self.baseURL + self.path) else { return nil }
        return url
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
}
