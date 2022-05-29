//
//  Arbuz.swift
//  Arbuz(UIkit+SwiftUI)
//
//  Created by Yerkebulan Serikov on 28.05.2022.
//

import Foundation
import SwiftUI

struct Arbuz{
    var weight = Double(Int(Double.random(in: 7.00...12.00)*100))/100
    // Needed to set random status in future will be depricated || Below
    var fortuna = Double.random(in: 0.0...10)
    // Needed to set random status in future will be depricated || Above
    var status: Status
    init(){
        if fortuna < 7{
            status = .green
        }
        else {
            status = .yellow
        }
    }
    
    enum Status: String {
        case green = "green"
        case yellow = "yellow"
        case blue = "blue"
    }
    
    func getStatusColor() -> Color{
        if(status == .green){ return .green }
        else if (status == .yellow){ return .yellow }
        return .blue
    }
    
    mutating func resetColor(){
        if fortuna < 7{
            status = .green
        }
        else {
            status = .yellow
        }
    }
    
    mutating func selectArbuz(){
        status = .blue
    }
    
    mutating func deselectArbuz(){
        resetColor()
    }
    
    func getRipnessOfArbuz() -> String{
        if fortuna < 7{
            return "спелый"
        }
        else {
            return "неспелый"
        }
    }
}
