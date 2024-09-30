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
                    .foregroundStyle(Colors.blackColor87)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke( (viewModel.name.isEmpty) 
                                     ?(viewModel.isSignUpButtonPressed ? Colors.primaryAlertColor : Colors.secondaryLightBrounColor)
                                     : (viewModel.isNameValid ? Colors.primaryColor : Colors.primaryAlertColor ),
                                     lineWidth: 1)
                    )
                    .keyboardType(.default)
                    .submitLabel(.done)
                    .focused($focusedField, equals: .name)
                    .onSubmit {
                        if viewModel.isNameValid {
                            focusedField = .email
                        }
                    }
                
                if viewModel.name.isEmpty {
                    if viewModel.isSignUpButtonPressed {
                        Text("Required field")
                            .footnoteRedStyle()
                    }
                } else {
                    if !viewModel.isNameValid {
                        Text("The name must be at least 2 characters.")
                            .footnoteRedStyle()
                    }
                }
            }
            VStack{
                TextField("Email", text: $viewModel.email)
                    .customStyle()
                    .foregroundColor(Colors.blackColor87)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke( (viewModel.email.isEmpty) 
                                     ? (viewModel.isSignUpButtonPressed ? Colors.primaryAlertColor: Colors.secondaryLightBrounColor)
                                     : (viewModel.isEmailValid ? Colors.primaryColor : Colors.primaryAlertColor),
                                     lineWidth: 1
                                   )
                    )
                    .keyboardType(.emailAddress)
                    .submitLabel(.done)
                    .focused($focusedField, equals: .email)
                    .onSubmit {
                        if viewModel.isEmailValid {
                            focusedField = .phone
                        }
                    }
                    .autocapitalization(.none)
                if viewModel.email.isEmpty {
                    if viewModel.isSignUpButtonPressed {
                        Text("Required field")
                            .footnoteRedStyle()
                    }
                } else {
                    if !viewModel.isEmailValid {
                        Text("Invalid email format.")
                            .footnoteRedStyle()
                    }
                }
            }
            
            VStack{
                VStack{
                    TextField("Phone", text: $viewModel.phone)
                        .customStyle()
                        .foregroundColor(Colors.blackColor87)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke( (viewModel.phone == "+380") 
                                         ?(viewModel.isSignUpButtonPressed ? Colors.primaryAlertColor : Colors.secondaryLightBrounColor)
                                         : (viewModel.isPhoneValid ? Colors.primaryColor : Colors.primaryAlertColor),
                                         lineWidth: 1
                                       )
                        )
                        .keyboardType(.default)
                        .submitLabel(.done)
                        .focused($focusedField, equals: .phone)
                        .onSubmit {
                            if viewModel.isPhoneValid {
                                focusedField = nil
                            }
                        }
                    if viewModel.phone == "+380" {
                        if viewModel.isSignUpButtonPressed {
                            Text("Required field")
                                .footnoteRedStyle()
                        }
                    } else {
                        if !viewModel.isPhoneValid {
                            Text("The phone must be a valid.")
                                .footnoteRedStyle()
                        }
                    }
                    Text("+38 (XXX) XXX - XX -XX")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

#Preview {
    TextFieldsGroupView()
}
