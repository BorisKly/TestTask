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
    @StateObject var keyboardResponder = KeyboardResponder()

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 20){
                TextFieldsGroupView()
                if !keyboardResponder.isKeyboardVisible {
                    withAnimation(.easeInOut) {
                        HStack{
                            PositionsView()
                            Spacer()
                        }
                    }
                }
                UploadPhotoView()
                if !keyboardResponder.isKeyboardVisible {
                    SignUpButoonView()
                }
                Spacer()
            }
            .frame(
                maxWidth: 400,
                maxHeight: geometry.size.height - keyboardResponder.keyboardHeight
            )
            .padding()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

//#Preview {
//    SignUpView()
//}
