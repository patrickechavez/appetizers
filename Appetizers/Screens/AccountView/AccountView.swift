//
//  AccountView.swift
//  Appetizers
//
//  Created by John Patrick Echavez on 6/14/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section("Personal Info") {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusTextField,equals: .firstName)
                        .onSubmit { focusTextField = .lastName }
                        .submitLabel(.next)
                        .autocorrectionDisabled()
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusTextField,equals: .lastName)
                        .onSubmit { focusTextField = .email }
                        .submitLabel(.continue)
                        .autocorrectionDisabled()
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusTextField,equals: .email)
                        .onSubmit { focusTextField = nil }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    DatePicker("Birthday",
                               selection: $viewModel.user.birthDate,
                               in: Date().eighteenYearsAgo...Date(),
                               displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                    }label: {
                        Text("Save Changes")
                    }
                }
                
               
                Section("Request") {
                    Toggle(isOn: $viewModel.user.extraNapkins, label: {
                        Text("Extra Napkins")
                    })
                    Toggle(isOn: $viewModel.user.frequentRefills) {
                        Text("Frequent Refills")
                    }
                }
                .tint(Color.brandPrimary)
              
            }
            .onAppear {
                viewModel.retrieveUser()
            }
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
        
            .navigationTitle("Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusTextField = nil }
                }
            }
        }
    }
}


#Preview {
    AccountView()
}
