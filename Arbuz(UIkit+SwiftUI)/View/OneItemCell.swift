//
//  OneItemCell.swift
//  Arbuz(UIkit+SwiftUI)
//
//  Created by Yerkebulan Serikov on 01.06.2022.
//

import SwiftUI

struct OneItemCell: View {
 
    // MARK: - CartSingleton
    @ObservedObject var cartViewModel = CartViewModel.cartObj
    @State var index: Int

    var body: some View {
        HStack(spacing: 0){
            Image(cartViewModel.selectedProducts[index].product.name)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .cornerRadius(20)
            VStack(){
                TopTextOfCell()
                Spacer()
                LowTextAndButtonOfCell()
            }
        }
    }
    
    @ViewBuilder func TopTextOfCell()-> some View{
        HStack(alignment: .top){
            VStack(alignment: .leading){
                Text(cartViewModel.selectedProducts[index].product.description)
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                Text("шт")
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .fontWeight(.medium)
            }
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
        }.padding(.top, 7)
            .padding(.leading, 15)
            .padding(.trailing, 0)
    }
    
    @ViewBuilder func LowTextAndButtonOfCell() -> some View {
        HStack(){
            buyButton()
                .frame(width: 100, height: 33)
                .cornerRadius(10)
                .padding(.leading, 15)
            Spacer()
            Text("\(cartViewModel.selectedProducts[index].getOverallPrice()) ₸")
                .font(.callout)
        }
    }
    
    @ViewBuilder func buyButton() -> some View {
        HStack(spacing: 2){
            if cartViewModel.selectedProducts[index].amount != 0 {
                Button {
                    withAnimation(.easeOut(duration: 0.5)) {
                        if(cartViewModel.selectedProducts[index].amount != 0) {
                            cartViewModel.selectedProducts[index].decrementAmountByOne()
                        }
                    }
                    cartViewModel.syncronizeProductWithCart(product: cartViewModel.selectedProducts[index].product, amount: cartViewModel.selectedProducts[index].amount)
   
                } label: {
                    Image(systemName: "minus")
                        .foregroundColor(.white)
                        .padding(.leading, 5)
                }
                Spacer()
            }else{
                Spacer()
            }
            if  cartViewModel.selectedProducts[index].amount != 0 {
                Text("x \(cartViewModel.selectedProducts[index].amount)")
                    .foregroundColor(.white)
                    .font(.body)
                Spacer()
            }else{
                Text("\(cartViewModel.selectedProducts[index].product.price)₸")
                    .foregroundColor(.white)
                    .font(.body)
            }
            Button {
                withAnimation(.easeOut(duration: 0.5)) {
                    cartViewModel.selectedProducts[index].amount+=1
                }
                cartViewModel.syncronizeProductWithCart(product: cartViewModel.selectedProducts[index].product, amount: cartViewModel.selectedProducts[index].amount)
       
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .padding(.trailing, 5)
            }
            if cartViewModel.selectedProducts[index].amount == 0{
                Spacer()
            }
        }
        .padding(.vertical, 10)
        .ignoresSafeArea()
        .background((cartViewModel.selectedProducts[index].amount==0) ? .gray : .green)
        .onTapGesture {
            if cartViewModel.selectedProducts[index].amount == 0{
                withAnimation(.easeOut(duration: 0.5)) {
                    cartViewModel.selectedProducts[index].amount = 1
                    cartViewModel.syncronizeProductWithCart(product: cartViewModel.selectedProducts[index].product, amount: cartViewModel.selectedProducts[index].amount)
               
                }
            }
        }
        
    }
}

//struct OneItemCell_Previews: PreviewProvider {
//    static var previews: some View {
//        OneItemCell()
//    }
//}
