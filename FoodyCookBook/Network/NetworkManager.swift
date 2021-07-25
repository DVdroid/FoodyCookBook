//
//  NetworkManager.swift
//  FoodyCookBook
//
//  Created by Vikash Anand on 25/07/21.
//

import Foundation

final class NetworkManager {

    fileprivate class func buildURL(endpoint: API) -> URLComponents {

        var components = URLComponents()
        components.scheme = endpoint.scheme.rawValue
        components.host = endpoint.baseURL
        components.path = endpoint.path

        if !endpoint.parameters.isEmpty {
            components.queryItems = endpoint.parameters
        }

        return components
    }

    class func request<T: Decodable>(endpoint: API,
                                     completion: @escaping (Result<T, Error>) -> Void) {

        let components = buildURL(endpoint: endpoint)
        guard let url = components.url else {
            print("URL creation error")
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method.rawValue
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print("Unknown error \(error)")
                return
            }

            guard response != nil, let data = data else { return }
            do {
                let responseObject = try JSONDecoder().decode(T.self, from: data)
                completion(.success(responseObject))
            } catch let error  {
                completion(.failure(error))
                print("Decode error \(error)")
            }
        }

        dataTask.resume()
    }
}
