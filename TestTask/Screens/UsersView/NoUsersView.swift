//
//  NoUsersView.swift
//  TestTask
//
//  Created by Borys Klykavka on 27.09.2024.
//

import SwiftUI

struct NoUsersView: View {
    
    var body: some View {
        VStack{
            Spacer()
            VStack(spacing: 20) {
                Spacer()
                Image("noUsersImage")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text("There is no users yet")
                    .custom20()
                Spacer()
            }
            Spacer()
        }
        .background(Color.white)
    }
}

#Preview {
    NoUsersView()
}
