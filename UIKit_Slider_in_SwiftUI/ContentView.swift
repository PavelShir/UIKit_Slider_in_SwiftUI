//
//  ContentView.swift
//  UIKit_Slider_in_SwiftUI
//
//  Created by 19543442 on 30.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var randomNumber = Int.random(in: 1...100)
    @State var currentValue = 50.0
    @State var alertPresented = false
    
    var body: some View {
        
        VStack {
            Text("Подвинте слайдер, как можно ближе к: \(randomNumber)")
            
            HStack {
                Text("0")
                SliderView(sliderValue: $currentValue, alpha: computeScore())
                    .onChange(of: currentValue) { newValue in
                        
                    }
                Text("100")
            }
            .padding()
         
            Button {
                alertPresented = true
                }
                label: {
                    Text("Проверь меня!")
            }
            .alert("Good try!", isPresented: $alertPresented)
                {
                Button("Ok", action: {})
                } message: {
                 Text ("Ты набрал \(computeScore()) %")
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
