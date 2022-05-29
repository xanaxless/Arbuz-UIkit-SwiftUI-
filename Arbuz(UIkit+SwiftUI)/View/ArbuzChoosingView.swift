//
//  ArbuzChoosingView.swift
//  Arbuz(UIkit+SwiftUI)
//
//  Created by Yerkebulan Serikov on 28.05.2022.
//

import SwiftUI

struct ArbuzChoosingView: View {
    // MARK: - Properties
    @ObservedObject var fieldViewModel = ArbuzChoosingViewModel()
    @State var isOrderValid: Bool = false
    // MARK: - Body
    var body: some View {
        VStack {
            Text("Выбери свой арбуз")
                .font(.headline)
                .fontWeight(.bold)
            Garden()
                .padding([.leading,.trailing,.bottom])
                .padding(.top, 20)
            Explanation()
            ChosedWatermellons()
                .padding()
            Spacer()
            OrderButton()
        }
    }
    
    @ViewBuilder func Explanation() -> some View{
        HStack(spacing: 10){
            OneCase(color: .green , situation: "Спелый")
            OneCase(color: .yellow, situation: "Неспелый")
            OneCase(color: .blue, situation: "выбран")
        }
    }
    
    @ViewBuilder func OneCase(color: Color, situation: String) -> some View{
        HStack(spacing:5){
            Circle()
                .foregroundColor(color)
                .frame(width: 20, height: 20, alignment: .center)
            Text(situation)
        }.foregroundColor(color)
    }
    
    @ViewBuilder func Garden() -> some View{
        HStack {
            ForEach(0..<fieldViewModel.field.count, id: \.self) { row in
                VStack{
                    ForEach(0..<fieldViewModel.field[0].count, id: \.self){ column in
                        Watermellon(arbuz: fieldViewModel.field[row][column], row: row, column: column)
                    }
                }.padding(.horizontal)
            }
        }
    }
    
    @ViewBuilder func Watermellon(arbuz: Arbuz, row: Int, column: Int) -> some View {
        Circle()
            .foregroundColor(arbuz.getStatusColor())
            .frame(width: 20, height: 20, alignment: .center)
            .onTapGesture {
                withAnimation(.easeOut(duration: 0.2)) {
                    fieldViewModel.addArbuzOrDeselect(row: row, column: column)
                    if(fieldViewModel.chosenArbuz.count == 0){
                        isOrderValid = false
                    }else {
                        isOrderValid = true
                    }
                }
            }
    }
    
    @ViewBuilder func ChosedWatermellons() -> some View{
        VStack(alignment: .center, spacing: 10){
            HStack {
                Text("Выбраные")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Spacer()
            }
            HStack(spacing: 10){
                ForEach(fieldViewModel.chosenArbuz, id: \.self){ index in
                    OneChoosenMellon(arbuz: fieldViewModel.field[index[0]][index[1]])
                }
            }
        }
        
    }
    
    @ViewBuilder func OneChoosenMellon(arbuz: Arbuz) ->some View{
        Group {
            VStack(spacing: 5){
                Text("\(String(format: "%g", arbuz.weight)) kg")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("\(arbuz.getRipnessOfArbuz())")
                    .font(.body)
                    .fontWeight(.medium)
            }
        }
        .frame(width: 100, height: 130, alignment: .center)
        .background(.secondary)
        .cornerRadius(20)
        
    }
    
    @ViewBuilder func OrderButton() -> some View{
        NavigationLink {
            FinalStageofArbuzOrderView()
        } label: {
            HStack(){
                Spacer()
                Text("Заказ на \(fieldViewModel.getOverAllPrice())₸")
                    .foregroundColor(.white)
                Spacer()
            }
            .frame(height: 55)
            .background(.green)
        }
        .disabled(!isOrderValid)
        
    }
    
}
    
    
    

struct ArbuzChoosingView_Previews: PreviewProvider {
    static var previews: some View {
        ArbuzChoosingView()
    }
}
