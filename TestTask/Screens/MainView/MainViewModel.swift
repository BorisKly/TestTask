//
//  MainViewModel.swift
//  TestTask
//
//  Created by Borys Klykavka on 26.09.2024.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published  var selectedTab = 0
    
    @Published var infoModel: InfoViewEnum?
    @Published var showInfoViewModal = false

}
