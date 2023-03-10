//
//  FavoriteAPI.swift
//  eShop
//
//  Created by Văn Khánh Vương on 25/12/2022.
//

import Alamofire

enum FavoriteAPI {
    case findFavorite(userId: String)
    case checkFavorite(productId: String, userId: String)
    case addFavorite(productId: String, userId: String)
    case deleteFavorite(id: String)
}

extension FavoriteAPI: TargetType {
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
        case .addFavorite:
            return "add_product_favorite.php"
        case .findFavorite:
            return "get_favorite_by_user_id.php"
        case .checkFavorite:
            return "check_favorites.php"
        case .deleteFavorite:
            return "delete_product_favorite.php"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters? {
        switch self {
        case .findFavorite(let userId):
            return ["userId": userId]
        case .checkFavorite(let productId, let userId):
            return ["productId":productId,
                    "userId":userId
            ]
        case .addFavorite(let productId, let userId):
            return ["productId":productId,
                    "userId":userId
            ]
        case .deleteFavorite(let id):
            return ["id":id]
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

