//
//  DetailView.swift
//  Arbuz(UIkit+SwiftUI)
//
//  Created by Yerkebulan Serikov on 28.05.2022.
//

import SwiftUI

struct DetailedProductView: View {
    // MARK: - Properties
    @Environment(\.presentationMode) var presentation
    @State var product: Product
    @State var isButtonChanged: Bool = false
    @State var amountofChosenProduct: Int = 0
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    MainViewofProduct()
                        .ignoresSafeArea(.all)
                }
                if(product.name == "арбуз"){
                    NavigationLink {
                        ArbuzChoosingView()
                    } label: {
                        ArbuzBuyingView()
                    }
                }else{
                    BottomButton()
                }
            }
            .navigationBarHidden(false)
            .navigationBarTitle("", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.presentation.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                    } label: {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.secondary)
                    }
                }
            }

        }
        
    }
    
    // MARK: - MainViewofProduct
    @ViewBuilder func MainViewofProduct() -> some View{
        VStack(spacing: 5){
            Image(product.name)
                .resizable()
                .scaledToFit()
            Text(product.description)
                .font(.body)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding( .top, 5)
                .padding(.horizontal, 15)
            Text("шт")
                .foregroundColor(.secondary)
                .fontWeight(.medium)
            Divider()
            HStack(){
                Text("Описание")
                    .padding(.leading, 12)
                Spacer()
            }
            Text(product.fullDescription)
                .padding(.horizontal, 12)
                .font(.callout)
                .multilineTextAlignment(.leading)
                .foregroundColor(.gray)
            
        }
    }
    
    // MARK: - BottomButton
    @ViewBuilder func BottomButton() -> some View{
        HStack(spacing: 10){
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
                        .font(.title2)
                }
                Spacer()
            }else{
                Spacer()
            }
            Text("\(product.price)₸")
                .foregroundColor(.white)
                .font(.title3)
            if isButtonChanged == true && amountofChosenProduct != 0 {
                Text("x \(amountofChosenProduct)")
                    .foregroundColor(.white)
                    .font(.title3)
                Spacer()
            }
            Button {
                withAnimation(.easeOut(duration: 0.5)) {
                    isButtonChanged = true
                    amountofChosenProduct+=1
                }
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.title2)
            }
            if isButtonChanged == false && amountofChosenProduct == 0{
                Spacer()
            }
        }
        .frame(width: .infinity, height: 70)
        .padding(.horizontal)
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
    
    
    // MARK: - ArbuzBuyingView
    
    @ViewBuilder func ArbuzBuyingView() -> some View{
        HStack(alignment: .center, spacing: 10){
            Spacer()
            Text("\(product.price)₸")
                .foregroundColor(.white)
                .font(.title3)
            Spacer()
        }
        .frame(width: .infinity, height: 55)
        .background(.green)
    }
}




// MARK: - Preview
struct DetailedProductView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedProductView(product: Constants.watermellon)
    }
}
