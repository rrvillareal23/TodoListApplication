//
//  RegisterView.swift
//  TodoList
//
//  Created by Ricky Villareal on 5/6/24.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack{
            // Header
            HeaderView(title: "Register",
                       subtitle: "Start Organizing Todos!",
                       angle: -15,
                       background: .green)
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()

                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Create Account", background: .green) {
                    // attempt registration
                    viewModel.register()
                }
                
            }
            .offset(y:-50)
            
            Spacer()
            
        }
    }
}

#Preview {
    RegisterView()
}
