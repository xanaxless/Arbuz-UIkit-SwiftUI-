//
//  FinalStageofArbuzOrderView.swift
//  Arbuz(UIkit+SwiftUI)
//
//  Created by Yerkebulan Serikov on 29.05.2022.
//

import SwiftUI
import iPhoneNumberField
import iTextField

struct FinalStageofArbuzOrderView: View {
    // MARK: - View Properties
    @State private var nameText = ""
    @State private var phoneText = ""
    @State private var phoneEditing = false
    @State private var adress = ""
    @State private var numberofappartment = ""
    @State private var latter = ""
    @State private var date = Date()
    @State private var needSlicing: Bool = false
    @State private var selectedPaymentWay = "Kaspi"
    // MARK: - static properties
    let  paymentways = ["Kaspi", "Карточка", "Наличка"]
    
    var dateClosedRange: ClosedRange<Date> {
        let today = Calendar.current.date(byAdding: .hour, value: +2, to: Date())!
        let seven = Calendar.current.date(byAdding: .day, value: 9, to: Date())!
        return today...seven
    }
    
    // MARK: - body
    var body: some View {
        VStack(){
            formView()
            Spacer()
            buttonSendOrder()
        }
    }
    
    
    
    
    @ViewBuilder func formView() -> some View{
        Form {
            Section("Получатель и адресс доставки"){
                iTextField("Полное имя", text: $nameText)
                    .frame(height: 40)
                    iTextField("Адресс", text: $adress)
                        .frame(height: 40)
                HStack(){
                    iTextField("Квартира", text: $numberofappartment)
                        .frame(height: 40)
                    Divider()
                    iTextField("Этаж", text: $latter)
                        .frame(height: 40)
                }.frame(height: 40)
            }
            Section("Номер телефона"){
                iPhoneNumberField("Phone", text: $phoneText, isEditing: $phoneEditing)
                                .font(UIFont(size: 24, weight: .light, design: .monospaced))
                                .frame(height: 40)
            }
            Section("Время доставки") {
                HStack(){
                    DatePicker(selection: $date, in: dateClosedRange) {
                        Text("Выберите")
                            .font(.subheadline)
                    }
                }.frame( height: 50)
            }
            
            Section("Доп опции и оплата"){
                Toggle("Нарезать на дольки", isOn: $needSlicing)
                Picker("Способ оплаты", selection: $selectedPaymentWay) {
                    ForEach(paymentways, id: \.self){
                        Text($0)
                    }
                }
                
            }
        }
    }
    
    
    @ViewBuilder func buttonSendOrder() -> some View{
        HStack {
            Spacer()
            Text("Отправить заказ")
                .foregroundColor(.white)
            Spacer()
        }
        .frame(height: 55)
        .background(.green)
        
    }
}

struct FinalStageofArbuzOrderView_Previews: PreviewProvider {
    static var previews: some View {
        FinalStageofArbuzOrderView()
    }
}
