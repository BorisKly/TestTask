//
//  UploadPhotoView.swift
//  TestTask
//
//  Created by Borys Klykavka on 25.09.2024.
//

import SwiftUI
import PhotosUI

struct UploadPhotoView: View {
    
    @EnvironmentObject var viewModel: SignUpViewModel
    
    @State private var selectedItem: PhotosPickerItem? = nil

    var body: some View {
        VStack{
            HStack{
                Text("Upload your photo")
                    .padding()
                Spacer()
                PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                    Text("Upload")
                }
                .padding()
                .onChange(of: selectedItem) { newItem in
                    if let item = newItem {
                        item.loadTransferable(type: Data.self) { result in
                            switch result {
                            case .success(let data):
                                if let data = data {
                                    DispatchQueue.main.async {
                                        viewModel.selectedPhoto = data
                                        viewModel.validatePhoto() /// ??????
                                    }
                                }
                            case .failure(let error):
                                print("Error loading image: \(error.localizedDescription)")
                            }
                        }
                    }
                }
            }
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke( (viewModel.selectedPhoto == nil) ?
                             (viewModel.isSignUpButtonPressed ? .red : Colors.primaryColor) : (viewModel.isPhotoValid ? Colors.primaryColor : .red ),
                             lineWidth: 1)
            )
            
            if viewModel.selectedPhoto == nil {
                if viewModel.isSignUpButtonPressed {
                    Text("Required field")
                        .footnoteRedStyle()
                }
            }
        }
    }
}

#Preview {
    UploadPhotoView()
}
