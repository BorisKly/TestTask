//
//  MainViewModel.swift
//  TestTask
//
//  Created by Borys Klykavka on 26.09.2024.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published  var selectedTab = 0
    @Published var showSuccessRegistrationModal = false
    @Published var showAlreadyRegisteredModal = false

}
