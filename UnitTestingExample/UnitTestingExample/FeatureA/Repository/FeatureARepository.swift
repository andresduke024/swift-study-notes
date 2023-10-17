//
//  FeatureARepository.swift
//  UnitTestingExample
//
//  Created by Andres Duque on 14/10/23.
//

import Foundation

final class FeatureARepository: FeatureARepositoryProtocol {
    private let url: String = "https://fakestoreapi.com/products"
    
    private func buildURL() throws -> URL {
        guard let apiServiceUrl = URL(string: self.url) else {
            throw FeatureAError.invalidUrl
        }
        
        return apiServiceUrl
    }
    
    func fetch() async throws -> [FeatureAModel] {
        let apiServiceUrl = try buildURL()
        
        let (serviceData, _) = try await URLSession.shared.data(from: apiServiceUrl)
        
        guard let data = try? JSONDecoder().decode([FeatureAModel].self, from: serviceData) else {
            throw FeatureAError.decodeFailed
        }
        
        return data
    }
    
    func fetch(completion: @escaping (Result<[FeatureAModel], FeatureAError>) -> Void) {
        guard let apiServiceUrl = try? buildURL() else {
            completion(.failure(.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: apiServiceUrl) { data, _, error in
            guard error == nil else {
                completion(.failure(.generic))
                return
            }
            
            guard let serviceData = data, let model = try? JSONDecoder().decode([FeatureAModel].self, from: serviceData) else {
                completion(.failure(.decodeFailed))
                return
            }
            
            completion(.success(model))
        }
        .resume()
    }
}
