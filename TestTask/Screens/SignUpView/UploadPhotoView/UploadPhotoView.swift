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
    @State private var showConfirmationDialog = false
    @State private var showPhotoPicker = false

    var body: some View {
        VStack{
            HStack{
                Text("Upload your photo")
                    .padding()
                Spacer()
                if let imageData = viewModel.selectedPhoto,
                   let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .cornerRadius(50)
                } else {
                    Text("No Image Selected")
                }
                Spacer()
                Button("Upload") {
                    showConfirmationDialog = true
                }
                .confirmationDialog("Choose how you want to add a photo", isPresented: $showConfirmationDialog, titleVisibility: .visible) {
                            Button("Camera") { print("Вибрана опція 1") }
                            Button("Galery") { showPhotoPicker = true}
                            Button("Cancel", role: .cancel) { }
                        }
                .photosPicker(isPresented: $showPhotoPicker, selection: $selectedItem, matching: .images, photoLibrary: .shared())
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
                Spacer()
            }
            .cornerRadius(16)
            .frame(maxWidth: 320)
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
