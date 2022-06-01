//
//  CartViewModel.swift
//  Arbuz(UIkit+SwiftUI)
//
//  Created by Yerkebulan Serikov on 01.06.2022.
//

import Foundation

// Singleton will be in place due to the fact the we have only one cart in whole app
class CartViewModel: ObservableObject{
    // selectedProduct - is the list of product in cart
   @Published var selectedProducts: [ItemInCart] = [ItemInCart]()
    
    // create a singleton
     static let cartObj = CartViewModel()

     // create a private initializer
    private init() {
      
    }
    
    // to make same amount of product or erase product from chart(case amount == 0)
    func syncronizeProductWithCart(product : Product, amount: Int) {
        if(amount == 0){
            for (index, item) in selectedProducts.enumerated() {
                if(product.sameProduct(product: item.product)){
                    selectedProducts.remove(at: index)
                    return
                }
            }
        }
        else{
            for (index, item) in selectedProducts.enumerated() {
                if(product.sameProduct(product: item.product)){
                    selectedProducts[index].amount = amount
                    print(selectedProducts)
                    return
                }
            }
            var newItem = ItemInCart(product: product, amount: amount)
            selectedProducts.append(newItem)
        }
        print(selectedProducts)
    }
}
