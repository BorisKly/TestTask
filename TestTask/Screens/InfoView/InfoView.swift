//
//  InfoView.swift
//  TestTask
//
//  Created by Borys Klykavka on 29.09.2024.
//

import SwiftUI



struct InfoView: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel
    @EnvironmentObject var usersListViewModel: UsersListViewModel
    @EnvironmentObject var networkMonitor: NetworkMonitor
    let model = InfoModel()
    var infoType: InfoViewEnum

    
    var body: some View {
        HStack{
            Spacer()
            VStack(spacing: 20) {
                Spacer()
                
                Image(renderImage(for: infoType)
                )
                .resizable()
                .frame(width: model.imageWidth, height: model.imageHeight)
                
                Text(renderText(for: infoType))
                    .custom20()
              
                HStack {
                    Button(renderButtonTitle(for: infoType)) {
                        handleButtonAction(for: infoType)
                    }
                    .customStyle()
                }
                
                Spacer()
            }
            Spacer()
        }
        .background(Colors.whiteColor)
    }
    
    private func renderImage(for model: InfoViewEnum) -> String {
           switch model {
           case .internetConnection:
               return "internetConnectionImage"
           case .successRegistered:
               return "successRegistered"
           case .failRegistered:
               return "alreadyRegistered"
           }
       }
    private func renderText(for model: InfoViewEnum) -> String {
           switch model {
           case .internetConnection:
               return "There is no internet connection"
           case .successRegistered:
               return "Registration Successful!"
           case .failRegistered:
               return "That email or phone is already registered!"
           }
       }
    
    private func renderButtonTitle(for model: InfoViewEnum) -> String {
           switch model {
           case .internetConnection:
               return "Try again"
           case .successRegistered:
               return "Got it"
           case .failRegistered:
               return "Try again"
           }
       }
    
    private func handleButtonAction(for model: InfoViewEnum) {
           switch model {
           case .internetConnection:
               networkMonitor.checkConnection()
           case .successRegistered:
               mainViewModel.showInfoViewModal = false
               usersListViewModel.fetchUsers(page: 1)
               mainViewModel.selectedTab = 0
           case .failRegistered:
               mainViewModel.showInfoViewModal = false
           }
       }
    
}

#Preview {
    InfoView(infoType: .failRegistered)
}
