//
//  TextFieldsView.swift
//  TestTask
//
//  Created by Borys Klykavka on 25.09.2024.
//

import SwiftUI

enum Field: Hashable {
    case name
    case email
    case phone
}
struct TextFieldsGroupView: View {
    
    @EnvironmentObject var viewModel: SignUpViewModel
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        VStack(spacing: 10){
            VStack{
                TextField("Your name", text: $viewModel.name)
                    .customStyle()
                    .foregroundColor(viewModel.isNameValid ? Colors.primaryColor : .red)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(viewModel.isNameValid ? Colors.primaryColor : .red, lineWidth: 1)
                    )
                    .keyboardType(.default)
                    .submitLabel(.done)
                    .focused($focusedField, equals: .name)
                    .onChange(of: viewModel.name) { newValue in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: viewModel.validateName)
                    }
                    .onSubmit {
                        viewModel.validateName()
                        if viewModel.isNameValid {
                            focusedField = .email
                        }
                    }
                if !viewModel.isNameValid { Text(viewModel.name.isEmpty ? "Required field" : "The name must be at least 2 characters.")
                        .footnoteRedStyle()
                }
            }
            VStack{
                TextField("Email", text: $viewModel.email)
                    .customStyle()
                    .foregroundColor(viewModel.isEmailValid ? Colors.primaryColor : .red)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(viewModel.isEmailValid ? Colors.primaryColor : .red, lineWidth: 1)
                    )
                    .keyboardType(.emailAddress)
                    .submitLabel(.done)
                    .focused($focusedField, equals: .email)
                    .onChange(of: viewModel.email) { newValue in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: viewModel.validateEmail)
                    }
                    .onSubmit {
                        viewModel.validateEmail()
                        if viewModel.isEmailValid {
                            focusedField = .phone
                        }
                    }
                    .autocapitalization(.none)
                if !viewModel.isEmailValid { Text(viewModel.email.isEmpty ? "Required field" : "The email must be a valid email address.")
                        .footnoteRedStyle()
                }
            }
            VStack{
                VStack{
                    TextField("Phone", text: $viewModel.phone)
                        .customStyle()
                        .foregroundColor(viewModel.isPhoneValid ? Colors.primaryColor : .red)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(viewModel.isPhoneValid ? Colors.primaryColor : .red, lineWidth: 1)
                        )
                        .keyboardType(.numberPad)
                        .submitLabel(.done)
                        .focused($focusedField, equals: .phone)
                        .onChange(of: viewModel.phone) { newValue in
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: viewModel.validatePhone)
                        }
                        .onSubmit {
                            viewModel.validatePhone()
                            if viewModel.isPhoneValid {
                                focusedField = nil
                            }
                        }
                    if !viewModel.isPhoneValid { Text(viewModel.phone.isEmpty ? "Required field" : "The phone must be a valid phone.")
                            .footnoteRedStyle()
                    }
                    Text("+38 (XXX) XXX - XX -XX")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
    }
}

#Preview {
    TextFieldsGroupView()
}
