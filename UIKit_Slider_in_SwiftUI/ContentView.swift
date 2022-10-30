//
//  ContentView.swift
//  UIKit_Slider_in_SwiftUI
//
//  Created by 19543442 on 30.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var randomNumber = Int.random(in: 1...100)
    @State var currentValue =
    
    var body: some View {
        
        VStack {
            Text("Подвинте слайдер, как можно ближе к: \(randomNumber)")
            
            HStack {
                Text("0")
                SliderView()
                Text("100")
            }
            .padding()
         
            Button {
                .alert("Good try!", isPresented: true, actions: {}) {
                    "Нужное число \(randomNumber)"
                }
            } label: {
               Text("Проверь меня!")
            }
            
            Button {
                randomNumber = Int.random(in: 1...100)
            } label: {
               Text("Начать заново")
            }


        }

    }
    
    private func computeScore() -> Int {
        let targetValue = randomNumber
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
