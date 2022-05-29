//
//  ButtonOfFirstView.swift
//  Arbuz(UIkit+SwiftUI)
//
//  Created by Yerkebulan Serikov on 28.05.2022.
//

import SwiftUI

struct ButtonOfFirstView: View {
    @State var product : Product
    var body: some View {
        Capsule()
            .fill(.gray)
            .frame( height: 40)
            .overlay(
                HStack(){
                    Spacer()
                    Text("\(product.price)$")
                    Spacer()
                    Image(systemName: "plus")
                        .padding(.leading)
                    Spacer()
                }
            )
            .ignoresSafeArea()
    }
}

struct ButtonOfFirstView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonOfFirstView( product: Product(name: "watermellon", price: 143, description: "Watermellon from local farm. Choose your own watermellon on our garden"))
            .background(.yellow)
            .frame(width: 150, height: 250)
            .previewLayout(.sizeThatFits)
        
    }
}
