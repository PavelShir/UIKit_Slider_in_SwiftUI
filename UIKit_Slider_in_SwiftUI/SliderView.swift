//
//  SliderView.swift
//  UIKit_Slider_in_SwiftUI
//
//  Created by 19543442 on 30.10.2022.
//

import Foundation
import SwiftUI


struct SliderView: UIViewRepresentable {
  
   // @Binding var sliderValue: Float
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider()
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
      //  uiView.value = sliderValue
    }
    

}


struct SliderView_Previews: PreviewProvider {
    
    static var previews: some View {
        SliderView()
    }
}
