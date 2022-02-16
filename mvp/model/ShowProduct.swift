//
//  ShowProduct.swift
//  mvp
//
//  Created by Ahmed Saeed on 1/21/22.
//  Copyright © 2022 Ahmed Saeed. All rights reserved.
//

import Foundation
struct ShowProducts: Codable {
    let status: Bool
    let error: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: Int
    let name: String
    let image: String
    let products: [Product]
}

// MARK: - Product
struct Product: Codable {
    let id, categoryID: Int
    let name, productDescription, discount: String
    let size, extra: [Extra]
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case categoryID = "categoryId"
        case name
        case productDescription = "description"
        case discount, size, extra, image
    }
}

// MARK: - Extra
struct Extra: Codable {
    let id: Int
    let name, price: String
}
