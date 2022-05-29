//
//  ProductFirstViewButton.swift
//  Arbuz(UIkit+SwiftUI)
//
//  Created by Yerkebulan Serikov on 29.05.2022.
//

import SwiftUI

struct ProductFirstViewButton: View {
    
    @State var product: Product
    @State var amountChousen: Int = 0
    @State var isButtonChanged: Bool = false
    @State var amountofChosenProduct:Int  = 0

    var body: some View {
        buyButton()
            .cornerRadius(14)
    }
    
   
}

struct ProductFirstViewButton_Previews: PreviewProvider {
    static var previews: some View {
        ProductFirstViewButton(product: Constants.watermellon)
    }
}
