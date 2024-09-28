//
//  UsersListView.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

struct UsersListView: View {
    
    @EnvironmentObject var viewModel: UsersListViewModel
    
    var body: some View {
        VStack{
            if viewModel.users.isEmpty {
                NoUsersView()
            } else {
                NavigationStack {
                    GeometryReader { geometry in
                        HStack(spacing: 2) {
                            VStack(spacing: 0) {
                                Rectangle()
                                    .fill(Color.gray)
                                    .frame(width: 5, height: viewModel.calculateIndicatorHeight(geometry: geometry))
                                    .padding(.trailing, 4)
                                Rectangle()
                                    .fill(Color.gray.opacity(0.5))
                                    .frame(width: 5)
                                    .padding(.trailing, 4)
                                Spacer()
                            }
                            LazyVStack(alignment: .leading, spacing: 2)  {
                                Section {
                                    ForEach(viewModel.users) { user in
                                        styledUserView(for: user, height: geometry.size.height)
                                    }
                                }
                            }
                            .frame(height: geometry.size.height)
                        }
                        .gesture(
                            DragGesture()
                                .onEnded { value in
                                    if value.translation.height < 0 {
                                        viewModel.nextPage()
                                    } else if value.translation.height > 0 {
                                        viewModel.previousPage()
                                    }
                                }
                        )
                    }
                }
                .frame(maxWidth: 600)
            }
        }
    }
    private func styledUserView(for user: ResponseUser, height: CGFloat) -> some View {
            UserView(user: user)
                .frame(height: (height - CGFloat(viewModel.model.numberOfUsersPerPage + 1) * 2 ) / CGFloat(viewModel.model.numberOfUsersPerPage) )
    }
}

//#Preview {
//    UsersListView(users: [User])
//}

