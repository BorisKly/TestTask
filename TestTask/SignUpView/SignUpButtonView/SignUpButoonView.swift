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
            print("sign up")
            viewModel.registerNewUser()
        } label: {
            Text("Sign up")
        }
        .customStyle()
    }
}

#Preview {
    SignUpButoonView()
}
