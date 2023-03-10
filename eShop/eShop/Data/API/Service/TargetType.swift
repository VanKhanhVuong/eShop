//
//  TargetType.swift
//  eShop
//
//  Created by Văn Khánh Vương on 24/12/2022.
//

import Alamofire

protocol TargetType {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    var url: URL? { get }
    var encoding: ParameterEncoding { get }
}
