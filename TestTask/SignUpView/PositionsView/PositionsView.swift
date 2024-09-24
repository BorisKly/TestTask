//
//  PositionsView.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

struct PositionsView: View {
    
    @State private var selectedId: Int = 1
    @State private var userPositions: [ResponsePosition] = [];
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(userPositions, id: \.id) { position in
                RadioButton(id: position.id, label: position.name, selectedId: $selectedId)
            }
            
        }
        .padding()
        .onAppear { NetworkService.shared.getPositions { result in
            switch result {
            case .success(let result):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: result, options: [])
                    let positionsResponseData = try JSONDecoder().decode(PositionsResponseData.self, from: jsonData)
                    self.userPositions = positionsResponseData.positions
                } catch {
                    print("Error decoding UsersResponseData: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        }
    }
}

//#Preview {
//    PositionsView()
//}


