//
//  ContentView.swift
//  UIKit_Slider_in_SwiftUI
//
//  Created by 19543442 on 30.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var randomNumber = Int.random(in: 1...100)
    @Binding var currentValue: Double
    @State var alertPresented = false
    @State var result = 0
    
    var body: some View {
        
        VStack {
            Text("Подвинте слайдер, как можно ближе к: \(randomNumber)")
            
            HStack {
                Text("0")
                SliderView(sliderValue: $currentValue)
                Text("100")
            }
            .padding()
         
            Button {
                checkSliderValue()
                alertPresented.toggle()
                }
                label: {
                    Text("Проверь меня!")
            }
            .alert("Good try!", isPresented: $alertPresented)
                {
                Button("Ok", action: {})
                } message: {
                 Text ("Ты набрал \(result) %")
                }
            
            Button {
                randomNumber = Int.random(in: 1...100)
            } label: {
               Text("Начать заново")
            }


        }

    }
    
    private func checkSliderValue() -> Int {
        result = lround(currentValue)/randomNumber*100
        return result
    }
    
    private func computeScore() -> Int {
        let targetValue = randomNumber
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(currentValue: .constant(0.5))
    }
}
