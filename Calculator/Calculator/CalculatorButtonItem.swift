//
//  CalculatorButtonItem.swift
//  Calculator
//
//  Created by saber on 2021/6/28.
//
import SwiftUI
import Foundation

enum CalculatorButtonItem {
    
    enum Op: String {
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "x"
        case equal = "="
    }
    
    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    
    case digit(Int)
    case dot
    case op(Op)
    case command(Command)
}


enum Saber:String {
    case name = "name"
}

extension CalculatorButtonItem {
    var title: String {
        switch self {
        case .digit(let value): return String(value)
        case .dot: return  "."
        case .op(let op): return op.rawValue
        case .command(let command): return command.rawValue
        }
    }
    var size: CGSize {
        if case .digit(let value) = self, value == 0 {
            return CGSize(width: 88 * 2 + 8, height: 88)
        }
        return CGSize(width: 88, height: 88)
    }
    var backgroundColorName: String {
        switch self {
        case .digit, .dot: return "digit.background"
        case .op: return "operator.background"
        case .command: return "command.background"
        }
    }
    var fontColor: Color {
        switch self {
        case .command: return Color.yellow
        default: return Color.white
        }
    }
}

extension CalculatorButtonItem: Hashable {}

