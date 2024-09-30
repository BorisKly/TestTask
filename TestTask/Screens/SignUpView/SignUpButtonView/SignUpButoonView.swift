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
            viewModel.isSignUpButtonPressed = true
            
            if (viewModel.isNameValid &&
                viewModel.isEmailValid &&
                viewModel.isPhoneValid &&
                viewModel.isPhotoValid) {
                viewModel.registerUser()
            } 

        } label: {
            Text("Sign up")
                .foregroundStyle(Colors.blackColor87)
                .font(Fonts.primaryFont18)
        }
        .customStyle()
     
        
    }
}

#Preview {
    SignUpButoonView()
}
