//
//  Product .swift
//  Arbuz(UIkit+SwiftUI)
//
//  Created by Yerkebulan Serikov on 28.05.2022.
//
import Foundation

struct Product: Identifiable {
    let id = UUID()
    var name: String
    var price: Int
    var description: String
    var fullDescription: String
    
    // comparing two product to be same
    func sameProduct(product: Product) -> Bool {
        if(self.name == product.name){
            return true
            // in our case only name check will be enought
        }
        return false
    }
}
