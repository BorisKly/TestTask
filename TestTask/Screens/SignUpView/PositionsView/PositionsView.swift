//
//  PositionsView.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

struct PositionsView: View {
    
    @EnvironmentObject var viewModel: SignUpViewModel
    @State private var userPositions: [ResponsePosition] = [];
    
    var body: some View {
        HStack{
            VStack(spacing: 0){
                Text("Select your position")
                    .font(.headline)
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(userPositions, id: \.id) { position in
                        RadioButton(id: position.id, label: position.name, selectedId: $viewModel.selectedId)
                    }
                }
                .padding()
                .onAppear {
                    NetworkService.shared.getPositions { result in
                        switch result {
                        case .success(let result):
                            let json = result.json
                            let statusCode = result.statusCode
                            do {
                                let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
                                let positionsResponseData = try JSONDecoder().decode(PositionsResponseData.self, from: jsonData)
                                self.userPositions = positionsResponseData.positions
                                print(statusCode)
                            } catch {
                                print("Error decoding UsersResponseData: \(error.localizedDescription)")
                            }
                        case .failure(let error):
                            switch error {
                            case .invalidUrl:
                                print("statusCode")
                            case .invalidTask:
                                print("statusCode")
                            case .invalidResponse:
                                print("statusCode")
                            case .serverError(json: let json, statusCode: let statusCode):
                                if (statusCode == 404) || (statusCode == 422)  {
                                    print("\(statusCode): Positions not found")
                                }
                            case .customError(message: let message, statusCode: let statusCode):
                                print(message)
                            }
                        }
                        
                    }
                }
            }
            Spacer()
        }
        .frame(maxWidth: 600)
    }
}

//#Preview {
//    PositionsView()
//}


