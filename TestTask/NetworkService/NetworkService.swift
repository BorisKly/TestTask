//
//  NetworkService.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import Foundation

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case invalidResponse
    case serverError(Any)
    case invalidJson
    case unsupportedContentType
}

class NetworkService {
    
    let scheme = "https"
    let host = "frontend-test-assignment-api.abz.agency"
        
    public static let shared = NetworkService()
    private init() {}
    
    private func getHeader(accessToken: String? = nil, isMultipart: Bool = false) -> [String: String] {
        var header: [String: String] = ["Content-Type": isMultipart ? "multipart/form-data" : "application/json"]
        if let token = accessToken {
            header["Authorization"] = "Bearer \(token)"
        }
        return header
    }
    
    private func formUrl(endpoint: NetworkApiMethods,
                         settings: [String: Any]? = nil,
                         data: [String: Any]? = nil) -> String {
        
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = endpoint.path

        var queryParams = data?["queryParams"] as? [String: String] ?? [:]
        components.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }

        return components.url?.absoluteString ?? ""
    }
    
    private func sendRequest(method: String,
                             url: String,
                             headers: [String: String]? = nil,
                             body: Any? = nil,
                             isImageUpload: Bool = false,
                             completion: @escaping (Result<Any, Error>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(NetworkError.invalidUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = headers ?? getHeader()
        
        
        print(request)
        
        if method != "GET" {
            if isImageUpload {
                request.httpBody = body as? Data
            } else if let body = body {
                request.httpBody = try? JSONSerialization.data(withJSONObject: body)
            }
        }
        
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
    
    private func GET(url: String,
                     headers: [String: String]? = nil,
                     completion: @escaping (Result<Any, Error>) -> Void) {
        sendRequest(method: "GET",
                    url: url,
                    headers: headers,
                    body: nil,
                    isImageUpload: false,
                    completion: completion)
    }
    
    private func POST(url: String,
                      headers: [String: String]? = nil,
                      body: Any? = nil,
                      isImageUpload: Bool = false,
                      completion: @escaping (Result<Any, Error>) -> Void) {
        sendRequest(method: "POST",
                    url: url,
                    headers: headers,
                    body: body,
                    isImageUpload: isImageUpload,
                    completion: completion)
    }
    
    private func PUT(url: String,
                     headers: [String: String]? = nil,
                     body: Any? = nil,
                     completion: @escaping (Result<Any, Error>) -> Void) {
        sendRequest(method: "PUT",
                    url: url,
                    headers: headers,
                    body: body,
                    isImageUpload: false,
                    completion: completion)
    }
    
    private func DELETE(url: String,
                        headers: [String: String]? = nil,
                        body: Any? = nil,
                        completion: @escaping (Result<Any, Error>) -> Void) {
        sendRequest(method: "DELETE",
                    url: url,
                    headers: headers,
                    body: body,
                    isImageUpload: false,
                    completion: completion)
    }
    
    func getUsers(data: [String: Any]?, settings: [String: Any]?, completion: @escaping (Result<Any, Error>) -> Void) {
        let url = formUrl(endpoint: .users, settings: settings, data: data)
        let headers = getHeader()
        GET(url: url, headers: headers, completion: completion)
    }
    
    func getPositions (completion: @escaping (Result<Any, Error>) -> Void) {
        let url = formUrl(endpoint: .positions, settings: nil, data: nil)
        let headers = getHeader()
        GET(url: url, headers: headers, completion: completion)
    }
    
    func getToken (completion: @escaping (Result<Any, Error>) -> Void) {
        let url = formUrl(endpoint: .token, settings: nil, data: nil)
        let headers = getHeader()
        GET(url: url, headers: headers, completion: completion)
    }
    
    func postUser(data: [String: Any]?, settings: [String: Any]?, completion: @escaping (Result<Any, Error>) -> Void) {
        let accessToken = settings?["accessToken"] as? String
        let url = formUrl(endpoint: .users, settings: settings, data: data)
        let headers = getHeader(accessToken: accessToken, isMultipart: true)
        POST(url: url, completion: completion)
    }
    
    
}

