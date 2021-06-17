//
//  ContentView.swift
//  Calculator
//
//  Created by saber on 2021/6/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            print("button")
            print("button")
            print("button")
            print("button")
//            console.log("asdasd");
        }, label: {
            Text("+")
                .font(.system(size: 38))
                .foregroundColor(.white)
                .frame(width: 88, height: 88)
                .background(Color("operator.background"))
                .cornerRadius(44)
        })
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
