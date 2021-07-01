//
//  CalculatorModel.swift
//  Calculator
//
//  Created by saber on 2021/7/1.
//

import Foundation
import Combine

class CalculatorModel: ObservableObject {
//    let objectWillChange = PassthroughSubject<Void, Never>()
//    var brain: CalculatorBrain = .left("0") {
//        willSet { objectWillChange.send() }
//    }
    @Published var brain: CalculatorBrain = .left("0")
    
    @Published var history: [CalculatorButtonItem] = []
}
