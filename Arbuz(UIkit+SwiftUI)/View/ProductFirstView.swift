//
//  ProductFirstView.swift
//  Arbuz(UIkit+SwiftUI)
//
//  Created by Yerkebulan Serikov on 28.05.2022.
//

import SwiftUI

struct ProductFirstView: View {
    
    // MARK: - Properties
    @State var product: Product
    @State var showPopOverWindow: Bool = false
    @State var isButtonChanged: Bool = false
    @State var amountofChosenProduct:Int  = 0
    // MARK: - Body
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Button() {
                showPopOverWindow = true
            } label: {
                VStack(alignment: .leading, spacing: 2){
                    Image(product.name)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .padding(0)
                    Text(product.description)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .frame(height: 34)
                        .foregroundColor(.black)
                        .padding(.horizontal,9)
                    Text("шт")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray)
                        .padding(.leading, 9)
                }
            }.popover(isPresented: $showPopOverWindow ,
                      arrowEdge: Edge.trailing) {
                DetailedProductView(product:product)
            }
            buyButton()
                .frame(height: 33)
                .cornerRadius(14)
        }.ignoresSafeArea()
    }
    
    @ViewBuilder func buyButton() -> some View {
        HStack(spacing: 2){
            if isButtonChanged == true && amountofChosenProduct != 0 {
                Button {
                    withAnimation(.easeOut(duration: 0.5)) {
                        if(amountofChosenProduct != 0) {
                            amountofChosenProduct-=1
                            if(amountofChosenProduct == 0) {
                                isButtonChanged = false
                            }
                        }
                    }
                } label: {
                    Image(systemName: "minus")
                        .foregroundColor(.white)
                        .padding(.leading, 5)
                }
                Spacer()
            }else{
                Spacer()
            }
            if isButtonChanged == true && amountofChosenProduct != 0 {
                Text("x \(amountofChosenProduct)")
                    .foregroundColor(.white)
                    .font(.body)
                Spacer()
            }else{
                Text("\(product.price)₸")
                    .foregroundColor(.white)
                    .font(.body)
            }
            Button {
                withAnimation(.easeOut(duration: 0.5)) {
                    isButtonChanged = true
                    amountofChosenProduct+=1
                }
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .padding(.trailing, 5)
            }
            if isButtonChanged == false && amountofChosenProduct == 0{
                Spacer()
            }
        }
        .padding(.vertical, 10)
        .ignoresSafeArea()
        .background(.green)
        .onTapGesture {
            if isButtonChanged == false && amountofChosenProduct == 0{
                withAnimation(.easeOut(duration: 0.5)) {
                    isButtonChanged = true
                    amountofChosenProduct = 1
                }
            }
        }
        
    }
    
    
    
    
    
}

// MARK: - Preview
struct ProductFirstView_Previews: PreviewProvider {
    static var previews: some View {
        ProductFirstView(product: Constants.watermellon)
            .background(.yellow)
            .frame(width: 150, height: 250)
            .previewLayout(.sizeThatFits)
    }
}
