//
//  ItemInCart.swift
//  Arbuz(UIkit+SwiftUI)
//
//  Created by Yerkebulan Serikov on 01.06.2022.
//

import Foundation

struct ItemInCart: Identifiable{
    let id = UUID()
    var product: Product
    var amount: Int
    
    func getOverallPrice() ->Int{
        return product.price*amount
    }
    
    mutating func incrementAmountByOne(){
        amount+=1
    }
    
    mutating func decrementAmountByOne(){
        amount-=1
    }
}
