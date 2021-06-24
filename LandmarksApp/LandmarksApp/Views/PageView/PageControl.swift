//
//  PageControl.swift
//  LandmarksApp
//
//  Created by ya Liu on 2021/6/22.
//

import SwiftUI
import UIKit


struct PageControl: UIViewRepresentable {

    var numberOfPage: Int
    @Binding var currentPage: Int
    
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPage
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
}

