//
//  LoadingView.swift
//  Appetizers
//
//  Created by John Patrick Echavez on 6/19/24.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.customBrandPrimary
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            //ActivityIndicator()
            ProgressView()
            //ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(2)
                .tint(Color.brandPrimary)
        }
    }
}
