//
//  EmptyState.swift
//  Appetizers
//
//  Created by John Patrick Echavez on 6/23/24.
//

import SwiftUI

struct EmptyState: View {
    
    let imageName: String
    let message: String

    var body: some View {
            
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.secondary)
                    .padding()
            }
            
            
            
        }
        .offset(y: -50)
    }
}

#Preview {
    EmptyState(imageName: "empty-order" , message: "This our test message.")
}
