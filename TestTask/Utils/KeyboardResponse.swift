//
//  KeyboardResponse.swift
//  TestTask
//
//  Created by Borys Klykavka on 26.09.2024.
//

import SwiftUI
import Combine

class KeyboardResponder: ObservableObject {
    @Published var isKeyboardVisible: Bool = false
    @Published var keyboardHeight: CGFloat = 0

    private var cancellables: Set<AnyCancellable> = []

    init() {
        let willShowPublisher = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .map { notification in
                return (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height ?? 0
            }
        
        let willHidePublisher = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        
        willShowPublisher
            .merge(with: willHidePublisher)
            .assign(to: \.keyboardHeight, on: self)
            .store(in: &cancellables)

        willShowPublisher
            .map { _ in true }
            .merge(with: willHidePublisher.map { _ in false })
            .assign(to: \.isKeyboardVisible, on: self)
            .store(in: &cancellables)
    }
}
