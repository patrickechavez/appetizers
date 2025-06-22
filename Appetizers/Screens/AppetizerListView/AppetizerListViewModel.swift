//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by John Patrick Echavez on 6/19/24.
//

import Foundation

//Anything that happens in this view model that is UI-related will be rerouted to the main thread.
@MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetailView = false
    @Published var selectedAppetizer: Appetizer?
    /*
    func getAppetizers() {
        
        isLoading = true
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                
                self.isLoading = false
                
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    self.handleError(error: error)
                }
            }
        }
    }
    */
    
    func getAppetizers() {
        
        isLoading = true
        /*
        Task {
            do {
                self.appetizers = try await NetworkManager.shared.getAppetizers()
            } catch{
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
            isLoading = false
        }
        */
      
        Task {
            do {
                self.appetizers = try await NetworkManager.shared.getAppetizers()
            } catch let error as APError {
                handleAPError(error: error)
            } catch {
                alertItem = AlertContext.invalidResponse
            }
            
            isLoading = false
        }
        
    }
    
    private func handleAPError(error: APError) {
        switch error {
        case .invalidResponse:
            self.alertItem = AlertContext.invalidResponse
            
        case .invalidURL:
            self.alertItem = AlertContext.invalidURL
            
        case .invalidData:
            self.alertItem = AlertContext.invalidData
            
        case .unableToComplete:
            self.alertItem = AlertContext.unableToComplete
        }
    }

}
