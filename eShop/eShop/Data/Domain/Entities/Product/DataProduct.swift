//
//  DataProduct.swift
//  eShop
//
//  Created by Văn Khánh Vương on 25/12/2022.
//

import Foundation

struct DataProduct: Codable {
    var status: String?
    var product: [Product]?
    
    private enum CodingKeys: String, CodingKey {
        case status = "status"
        case product = "product"
    }
}

struct Product: Codable, Hashable {
    var productId: String?
    var productName: String?
    var imageProduct: String?
    var price: String?
    var detail: String?
    var rate: String?
    var categoryId: String?
    var brandId: String?
    var base: String?
    
    private enum CodingKeys: String, CodingKey {
        case productId = "productId"
        case productName = "productName"
        case imageProduct = "imageProduct"
        case price = "price"
        case detail = "detail"
        case rate = "rate"
        case categoryId = "categoryId"
        case brandId = "brandId"
        case base = "base"
    }
}
