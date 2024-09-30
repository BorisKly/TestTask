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
    
    @State private var showCamera = false
    @State private var selectedImage: UIImage? = nil

    var body: some View {
        VStack{
            HStack{
                Text("Upload your photo")
                    .font(Fonts.primaryFont18)
                    .foregroundStyle(Colors.blackColor60)
                    .padding()
                Spacer()
                Button("Upload") {
                    showConfirmationDialog = true
                }
                .confirmationDialog("Choose how you want to add a photo", isPresented: $showConfirmationDialog, titleVisibility: .visible) {
                            Button("Camera") { showCamera = true }
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
                .sheet(isPresented: $showCamera) {
                    ImagePicker(sourceType: .camera, selectedImage: $selectedImage)
                }
                .onChange(of: selectedImage) { newImage in
                    if let image = newImage {
                            DispatchQueue.main.async {
                                if let imageData = image.jpegData(compressionQuality: 0.8) {
                                    viewModel.selectedPhoto = imageData
                                    viewModel.validatePhoto()
                                }
                            }
                        }
                }
                Spacer()
            }
            .cornerRadius(16)
            .frame(maxWidth: 360)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke( (viewModel.selectedPhoto == nil) ?
                             (viewModel.isSignUpButtonPressed ? Colors.primaryAlertColor : Colors.secondaryLightBrounColor) : (viewModel.isPhotoValid ? Colors.primaryColor : .red ),
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
