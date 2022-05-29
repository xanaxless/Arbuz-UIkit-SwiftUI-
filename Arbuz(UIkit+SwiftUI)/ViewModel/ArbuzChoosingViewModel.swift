//
//  ArbuzChoosingViewModel.swift
//  Arbuz(UIkit+SwiftUI)
//
//  Created by Yerkebulan Serikov on 28.05.2022.
//

import Foundation
import SwiftUI

class ArbuzChoosingViewModel: ObservableObject {
    @Published var chosenArbuz: [[Int]] = [[Int]]()
    let row:Int = 6
    let amountinrow:Int = 10
    var field : [[Arbuz]] = {
        var fd = [[Arbuz]]()
        for i in 1...6 {
            var array = [Arbuz]()
            for j in 1...10 {
                array.append(Arbuz())
            }
            fd.append(array)
        }
        return fd
    }()
    
    
    func addArbuzOrDeselect(row: Int, column: Int){
        let array = [row, column]
        for (index, curarr) in chosenArbuz.enumerated(){
            if curarr == array{
                field[chosenArbuz[index][0]][chosenArbuz[index][1]].deselectArbuz()
                chosenArbuz.remove(at: index)
                return
            }
        }
        if chosenArbuz.count > 2{
            field[chosenArbuz[0][0]][chosenArbuz[0][1]].resetColor()
            chosenArbuz.remove(at: 0)
        }
        chosenArbuz.append(array)
        field[row][column].selectArbuz()
    }
    
    
    func getChosenArbuz(count: Int) -> Arbuz{
        return field[chosenArbuz[count][0]][chosenArbuz[count][0]]
    }
    
    func getOverAllPrice()->Int{
        var count: Double = 0;
        for index in chosenArbuz {
            count += 143*((field[index[0]][index[1]].weight))
        }
        return Int(count)
    }
    
}
