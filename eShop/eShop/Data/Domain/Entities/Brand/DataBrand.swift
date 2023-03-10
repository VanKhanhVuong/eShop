//
//  DataBrand.swift
//  eShop
//
//  Created by Văn Khánh Vương on 24/12/2022.
//

import Foundation

struct DataBrand: Codable {
    var status: String?
    var brand: [Brand]?
    
    private enum CodingKeys: String, CodingKey {
        case status = "status"
        case brand = "brandData"
    }
}

struct Brand: Codable {
    var brandId: String?
    var brandName: String?
    
    private enum CodingKeys: String, CodingKey {
        case brandId = "brandId"
        case brandName = "brandName"
    }
}
