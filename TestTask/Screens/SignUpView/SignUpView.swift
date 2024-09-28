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
//    @StateObject var keyboardResponder = KeyboardResponder()

    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    TextFieldsGroupView()
                    Spacer()
                    HStack{
                        PositionsView()
                        Spacer()
                    }
                    Spacer()
                    UploadPhotoView()
                    Spacer()
                    SignUpButoonView()
                    Spacer()
                }
                .padding()
                .frame(maxWidth: 600)

            }
        }
    }
}

//#Preview {
//    SignUpView()
//}
