//
//  SignUpButoonView.swift
//  TestTask
//
//  Created by Borys Klykavka on 25.09.2024.
//

import SwiftUI

struct SignUpButoonView: View {
    
    @EnvironmentObject var viewModel: SignUpViewModel
    
    var body: some View {
     
        Button {
            viewModel.registerUser()
        } label: {
            Text("Sign up")
        }
        .customStyle()
//        .disabled(viewModel.isNameValid ||
//                  viewModel.name.isEmpty ||
//                  viewModel.isEmailValid ||
//                  viewModel.email.isEmpty ||
//                  viewModel.isPhoneValid ||
//                  viewModel.phone.count < 5
//        )
    }
}

#Preview {
    SignUpButoonView()
}
