//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by John Patrick Echavez on 6/20/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var  order: Order
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 225)
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 225)
            }
//            AppetizerRemoteImage(urlString: appetizer.imageURL)
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 300, height: 225)
//            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                   
                    NutritionInfoView(title: "Calories", value: "\(appetizer.calories)")
                    NutritionInfoView(title: "Carbs", value: "\(appetizer.carbs) g")
                    NutritionInfoView(title: "Protein", value: "\(appetizer.protein) g")
                
                }
            }
            
            Spacer()
            
            Button {
                order.add(appetizer: appetizer)
                self.isShowingDetail = false
            }label: {
                APButton(title: "$\(appetizer.price , specifier: "%.2f") - Add to Cart")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(Button {
            self.isShowingDetail = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}

struct NutritionInfoView: View {
    
    let title: String
    let value: String

    
    var body: some View {
        
        VStack(spacing: 5) {
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            
            Text("\(value)")
                .foregroundStyle(Color.secondary)
                .fontWeight(.semibold)
                .italic()
            
        }
        
    }
}
