//
//  TextFieldsView.swift
//  TestTask
//
//  Created by Borys Klykavka on 25.09.2024.
//

import SwiftUI

struct TextFieldsGroupView: View {
    
    @EnvironmentObject var viewModel: SignUpViewModel
    
    var body: some View {
        VStack(spacing: 10){
            TextField("Your name", text: $viewModel.name)
                .customStyle()
            TextField("Email", text: $viewModel.email)
                .customStyle()
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            VStack{
                TextField("Phone", text: $viewModel.phone)
                    .customStyle()
                    .keyboardType(.phonePad)
                HStack{ Text("+38 (XXX) XXX - XX -XX")
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
        }
        .padding()
    }
}

#Preview {
    TextFieldsGroupView()
}
