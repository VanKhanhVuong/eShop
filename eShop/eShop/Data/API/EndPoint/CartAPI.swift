//
//  CartAPI.swift
//  eShop
//
//  Created by Văn Khánh Vương on 25/12/2022.
//

import Alamofire

enum CartAPI {
    case addCart(productId: String, userId: String, amount: Int)
    case findCart(userId: String)
    case checkCart(productId: String, userId: String)
    case deleteProductInCart(id: String)
    case updateAmountInCart(id: String, amount: Int)
    case updateOrderIdToCart(idOrder: String, userId: String)
}

extension CartAPI: TargetType {
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
        case .addCart:
            return "add_product_cart.php"
        case .findCart:
            return "get_cart_by_user_id.php"
        case .checkCart:
            return "check_cart.php"
        case .deleteProductInCart:
            return "delete_product_cart.php"
        case .updateAmountInCart:
            return "update_amount_product_cart.php"
        case .updateOrderIdToCart:
            return "update_idOrder_in_cart.php"
        }
    }
    
    var httpMethod: Alamofire.HTTPMethod {
        return .get
    }
    
    var parameters: Alamofire.Parameters? {
        switch self {
        case .addCart(let productId, let userId, let amount):
            return ["productId": productId,
                    "userId": userId,
                    "amount": amount
            ]
        case .findCart(let userId):
            return ["userId": userId]
        case .checkCart(let productId, let userId):
            return ["productId":productId,
                    "userId":userId
                    
            ]
        case .deleteProductInCart(let id):
            return ["id":id]
        case .updateAmountInCart(let id, let amount):
            return [
                "id": id,
                "amount": amount
            ]
        case .updateOrderIdToCart(let idOrder, let userId):
            return [
                "idOrder":idOrder,
                "userId":userId
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
