//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by saber on 2021/6/29.
//

import Foundation

enum CalculatorBrain {
    case left(String)
    case leftOp( left: String, op: CalculatorButtonItem.Op)
    case leftOpRight(left: String, op: CalculatorButtonItem.Op, right: String)
    case error
}

var formatter: NumberFormatter  = {
    let f = NumberFormatter()
    f.minimumFractionDigits = 0
    f.maximumFractionDigits = 8
    f.numberStyle = .decimal
    return f
}()

extension CalculatorBrain {
    var output: String {
        return "saber"
//        let result: String;
//        switch
    }
    
    func apply(item: CalculatorButtonItem) -> CalculatorBrain {
        return .left("7")
    }
}

struct viewSaber {
    var num = 0
    init(num1: Int) {
        num = num1
    }
    mutating func setNum(num1: Int) {
        num = num1
    }
}
