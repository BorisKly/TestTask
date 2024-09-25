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
            TextFieldsView()
            HStack{
                PositionsView()
                Spacer()
            }
            UploadPhotoView()
            SignUpButoonView()
            Spacer()
        }
    }
}

//#Preview {
//    SignUpView()
//}
