//
//  SignUpView.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    
    @State var name: String = ""
    @State var email: String = ""
    @State var phone: String = ""


    var body: some View {
        VStack{
            HeaderView(title: "Working with POST reques")
            Spacer()
            TextField("Your name", text: $name)
                .padding()
            TextField("Email", text: $email)
                .padding()
            VStack{
                TextField("Phone", text: $phone)
                HStack{ Text("+38 (XXX) XXX - XX -XX")
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
            .padding()
            
            Text("Select your position")
                .font(.title)
            
            PositionsView()
            
            HStack{
                Text("Upload your photo")
                    .padding()
                Spacer()
                Button {
                    print("upload Photo")
                } label: {
                    Text("Upload")
                }
                .padding()
            }
            .border(.cyan)
            .padding()
            
            Button {
                print("sign up")
            } label: {
                Text("Sign up")
            }


            

            Spacer()

        }
    }
}

#Preview {
    SignUpView()
}
