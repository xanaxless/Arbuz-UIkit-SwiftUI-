//
//  CartView.swift
//  Arbuz(UIkit+SwiftUI)
//
//  Created by Yerkebulan Serikov on 01.06.2022.
//

import SwiftUI

struct CartView: View {
    // MARK: - CartSingleton
    @ObservedObject var cartViewModel = CartViewModel.cartObj
    var body: some View {
        VStack(){
            List {
                ForEach(0..<cartViewModel.selectedProducts.count){ index in
                    OneItemCell(index: index)
                }
            }
            
            
        }
    }
    
    
   
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
