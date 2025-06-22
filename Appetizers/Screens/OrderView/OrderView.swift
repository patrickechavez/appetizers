//
//  OrderView.swift
//  Appetizers
//
//  Created by John Patrick Echavez on 6/14/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView{
            ZStack {
                
                if order.items.isEmpty {
                    
                    EmptyState(imageName: "empty-order", message: "You have no items in your order. Please add an appetizer")
                    
                }else {
                    
                    VStack {
                        List {
                            ForEach(order.items) { appetizer in
                                AppetizerListCell(appetizer: appetizer)
                                    .listRowSeparator(.hidden)
                            }
                            .onDelete(perform: order.deleteItem)
                        }
                        .listStyle(.plain)

                        
                        Button {
                            print("Order Places")
                        }label: {
                            APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                        }
                        .padding(.bottom, 30)
                    } 
                    
                }

            }
            
            .navigationTitle("Order")
        }
       
        
    }
 
        
}

#Preview {
    OrderView()
}
