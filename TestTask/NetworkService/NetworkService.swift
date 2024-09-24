//
//  NetworkService.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import Foundation
https://frontend-test-assignment-api.abz.agency/api/v1/users?page=2&count=10

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case invalidResponse
    case serverError(Any)
    case invalidJson
    case unsupportedContentType
}

class NetworkService {
    
    private let scheme = "https"
    private let host = "frontend-test-assignment-api.abz.agency"
//    private let apiKey = ConfigValues.get().AccessKeys.apiAccessKey
    
    
    public static let shared = NetworkService()
    private init() {}
    
    private func formatComponents(apiEndpoint: APIEndpoints) -> URLComponents{
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = apiEndpoint.path
        return components
    }
    
    private func formatQueryItems(apiEndpoint: APIEndpoints,
                                  page: String? = nil,
                                  count: String? = nil
                                  ) -> [URLQueryItem] {        
        switch apiEndpoint {
        case .users:
            queryItems.append(URLQueryItem(page: page, count: count));
        return queryItems
    }
    
    func sendRequest(apiEndpount: APIEndpoints,
                     currency: String? = nil,
                     fromCurrency: String? = nil,
                     toCurrency: String? = nil,
                     amount: String? = nil,
                     weight: String? = nil,
                     startDate: String? = nil,
                     endDate: String? = nil,
                     completion: @escaping (Result<Any, Error>) -> Void) {
        
        var components = formatComponents(apiEndpoint:apiEndpount)
        let quertyItems = formatQueryItems(apiEndpoint: .convert,
                                           currency: currency,
                                           fromCurrency:fromCurrency,
                                           toCurrency: toCurrency,
                                           amount: amount,
                                           weight: weight,
                                           startDate: startDate,
                                           endDate: endDate)
        components.queryItems = quertyItems

        guard let url = components.url else {
            completion(.failure(NetworkError.invalidUrl))
            return
        }
        print(url)
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                 completion(.failure(NetworkError.invalidResponse))
                return
            }
            let contentType = httpResponse.allHeaderFields["Content-Type"] as? String ?? ""
               
            if contentType.contains("application/json"), let data = data {
                   do {
                       let json = try JSONSerialization.jsonObject(with: data, options: [])
                       if (200...299).contains(httpResponse.statusCode) {
                           completion(.success(json))
                       } else {
                           completion(.failure(NetworkError.serverError(json)))
                       }
                   } catch {
                       completion(.failure(NetworkError.invalidJson))
                   }
               } else {
                   completion(.failure(NetworkError.unsupportedContentType))
               }
        }
        task.resume()
    }
}
