//
//  UserView.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

struct UserView: View {
        
    var user: ResponseUser
    
    var body: some View {
        HStack{
            VStack{
                Spacer()
                HStack(alignment: .top){
                    AsyncImage(url: URL(string: user.photo)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .frame(maxWidth: 50, maxHeight: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    VStack (alignment: .leading){
                        Text(user.name)
                            .font(Fonts.primaryFont18)
                            .foregroundStyle(Colors.blackColor87)
                        Spacer()
                        Text(user.position)
                            .font(Fonts.primaryFont14)
                            .foregroundStyle(Colors.blackColor60)
                        Spacer()
                        Text(user.email)
                            .font(Fonts.primaryFont14)
                            .foregroundStyle(Colors.blackColor87)
                        Spacer()
                        Text(user.phone.formatPhoneNumber())
                            .font(Fonts.primaryFont14)
                            .foregroundStyle(Colors.blackColor87)
                    }
                }
                Spacer()
            }
            Spacer()
        }.background(Colors.whiteColor)
    }
    
}

//#Preview {
//    UserView(user: ResponseUser())
//}
