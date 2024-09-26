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
                  .frame(width: 80, height: 80)
                  .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack (alignment: .leading){
                Text(user.name).font(.title)
                Text(user.position).font(.footnote)
                Text(user.email).font(.footnote)
                Text(user.phone).font(.footnote)
            }
            
        }
        
    }
}

//#Preview {
//    UserView(user: ResponseUser())
//}
