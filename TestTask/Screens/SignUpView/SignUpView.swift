//
//  SignUpView.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI
import PhotosUI

struct SignUpView: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel
    @EnvironmentObject var viewModel: SignUpViewModel
    
    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    TextFieldsGroupView()
                    Spacer()
                    ZStack{
                        HStack{
                            PositionsView()
                            Spacer()
                        }
                        if viewModel.isLoading {
                            ProgressView()
                        }
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
        .onReceive(viewModel.$infoModel) { item in
            mainViewModel.infoType = item
        }
    }
}

//#Preview {
//    SignUpView()
//}
