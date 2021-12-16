//
//  menuItem.swift
//  order (iOS)
//
//  Created by 陈润桐 on 2021/12/12.
//

import Foundation

class menuItem: NSObject, NSCoding {
    func encode(with coder: NSCoder) {
        coder.encode(self.ifChecked, forKey: "ifChecked")
        coder.encode(self.price, forKey: "price")
        coder.encode(self.name, forKey: "name")
    }
    
    required init?(coder: NSCoder) {
        self.ifChecked = coder.decodeBool(forKey: "ifChecked")
        self.price = coder.decodeObject(forKey: "price") as? Double ?? 0.0
        self.name = coder.decodeObject(forKey: "name") as? String ?? ""
    }
    
    var ifChecked: Bool = false
    var count_cart: Int = 0
    var price: Double = 0.0
    var name: String = ""
    var index: Int = 0
    
    init(ifChecked: Bool, price: Double, name: String) {
        self.ifChecked = ifChecked
        self.price = price
        self.name = name
    }
}
