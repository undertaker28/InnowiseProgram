//
//  NetworkingService.swift
//  NearEats
//
//  Created by Pavel on 6.08.23.
//

import Foundation
import Combine

protocol NetworkingService {
    func download(url: URL, headers: [String: String]?, parameters: [String: Any]?) -> AnyPublisher<Data, Error>
    func createURLRequest(url: URL, headers: [String: String]?, parameters: [String: Any]?) -> URLRequest
    func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data
    func handleCompletion(completion: Subscribers.Completion<Error>)
}

enum NetworkingErrors: Error {
    case informational(url: URL)
    case redirection(url: URL)
    case clientError(url: URL)
    case serverError(url: URL)
    case unknown(url: URL)
}

final class NetworkingServiceImpl: NetworkingService {
    func download(url: URL, headers: [String: String]?, parameters: [String: Any]?) -> AnyPublisher<Data, Error> {
        let requestURL = createURLRequest(url: url, headers: headers, parameters: parameters)
        
        return URLSession.shared.dataTaskPublisher(for: requestURL)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try self.self.handleURLResponse(output: $0, url: url)})
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func createURLRequest(url: URL, headers: [String: String]? = nil, parameters: [String: Any]? = nil) -> URLRequest {
        var requestURL = url
        
        if let parameters = parameters, var components = URLComponents(url: requestURL, resolvingAgainstBaseURL: false) {
            components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
            if let newURL = components.url {
                requestURL = newURL
            }
        }
        
        var request = URLRequest(url: requestURL)
        
        headers?.forEach { headerField, value in
            request.addValue(value, forHTTPHeaderField: headerField)
        }
        
        return request
    }
    
    func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        if let response = output.response as? HTTPURLResponse,
           response.statusCode < 200 && response.statusCode >= 300 {
            throw NetworkingErrors.init(code: response.statusCode, url: url)
        }
        return output.data
    }
    
    func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
