//
//  SignUpView.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI
import PhotosUI

struct SignUpView: View {
    
    @EnvironmentObject var viewModel: SignUpViewModel

    var body: some View {
        VStack{
            HeaderView(title: "Working with POST reques")
            Spacer()
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
            
            HStack{
                PositionsView()
                if let image = UIImage(data: viewModel.selectedPhoto) {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 80)
                                    .clipped()
                            } else {
                                Text("No image selected") // Текст на випадок, якщо зображення не вибрано
                                    .foregroundColor(.gray)
                            }
                Spacer()
            }
            
            UploadPhotoView()
           
            Button {
                print("sign up")
                viewModel.printRes()
            } label: {
                Text("Sign up")
            }
            Spacer()

        }
    }
}

//#Preview {
//    SignUpView()
//}
