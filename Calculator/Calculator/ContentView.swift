//
//  ContentView.swift
//  Calculator
//
//  Created by saber on 2021/6/17.
//



//let scale: CGFloat = UIScreen.main.bounds.width / 414 然后将 VStack 按照 scale 缩放即可:
//var body: some View {
// VStack(spacing: 12) {
//
//}
//  .scaleEffect(scale)
//}

import SwiftUI
import Foundation



struct ContentView: View {
    @State private var brain: CalculatorBrain = .left("0")
    @State var num = 0
    var num1 = 0
    
    mutating func setNum1(val: Int) {
        num1 = val
    }
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Button("Sign In", action: {
//                self.num1 = 2;
                self.num += 1
//                self.text = "测试" + String(self.num)
            })
            Text(brain.output).font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24)
                .lineLimit(1)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,  maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
            CalculatorButtonPad(brain: self.$brain)
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CalculatorButton: View {
    let fontSize: CGFloat = 38
    let title: String
//    var title: String = "+"
    let size: CGSize
    let backgroundColorName: String
    let fontColor: Color
    let action: () -> Void
//    init() {}
//
//    init(title: String) {
//        self.title = title
//    }
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(fontColor)
                .frame(width: size.width, height: size.height)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width / 2 )
        })
    }
}

struct CalculatorButtonRow: View {
    @Binding var brain: CalculatorBrain
    let row: [CalculatorButtonItem]
    var body: some View {
        HStack{
            ForEach(row, id: \.self) { item in
                CalculatorButton(title: item.title, size: item.size, backgroundColorName: item.backgroundColorName, fontColor: item.fontColor){
                    self.brain = self.brain.apply(item: item)
                }
            }
        }
    }
}

struct CalculatorButtonPad: View {
    
    @Binding var brain: CalculatorBrain
    
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
           [.digit(0), .dot, .op(.equal)]
    ]
    var body: some View {
        VStack(spacing: 8) {
//            Text(brain.output)
            ForEach(pad, id: \.self) {
//                row in
//                CalculatorButtonRow( row: row)
                CalculatorButtonRow( brain: self.$brain,row: $0)
            }
        }
    }
}
