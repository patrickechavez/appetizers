//
//  AppetizerTabView.swift
//  Appetizers
//
//  Created by John Patrick Echavez on 6/14/24.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem { Label("Home" , systemImage: "house") }
            AccountView()
                .tabItem { Label("Account" , systemImage: "person") }
            OrderView()
                .tabItem { Label("Order" , systemImage: "bag") }
                .badge(order.items.count)
        }
        .accentColor(.customBrandPrimary)
        .onAppear {
            // correct the transparency bug for Tab bars
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            
            /*
            // correct the transparency bug for Navigation bars
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            */
        }
    }
}

#Preview {
    AppetizerTabView()
        .environmentObject(Order())
        
}
