//
//  SliderView.swift
//  UIKit_Slider_in_SwiftUI
//
//  Created by 19543442 on 30.10.2022.
//

import Foundation
import SwiftUI


struct SliderView: UIViewRepresentable {
    
  
   @Binding var sliderValue: Double
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider()
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
      sliderValue = Double(uiView.value)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $sliderValue)
    }
    
}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var sliderValue: Double
        
        init(sliderValue: Binding<Double>) {
            self._sliderValue = sliderValue
        }
        
        @objc func sliderValueChanged(_ sender: UISlider) {
            sliderValue = Double(sender.value)
        }
    }
}


struct SliderView_Previews: PreviewProvider {
    
    static var previews: some View {
        SliderView(sliderValue: .constant(0.5))
    }
}
