//
//  ViewController.swift
//  eShop
//
//  Created by Văn Khánh Vương on 24/12/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            let api = BrandAPIClient()
            let a = await api.getAllBrand()
            print(a ?? [])
        }
    }
}

