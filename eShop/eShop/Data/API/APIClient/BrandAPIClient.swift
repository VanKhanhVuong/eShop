//
//  BrandAPIClient.swift
//  eShop
//
//  Created by Văn Khánh Vương on 24/12/2022.
//

import Foundation

class BrandAPIClient {
    func getAllBrand() async -> [Brand]? {
        let data = await APIManager.shared.request(request: BrandAPI.getBrand, dataModel: DataBrand.self)
        switch data {
        case .success(let data):
            let brands = data.brand
            return brands ?? []
        case .failure(let err):
            print(err)
            return []
        }
    }
}
