//
//  FeatureARepositoryProtocol.swift
//  UnitTestingExample
//
//  Created by Andres Duque on 14/10/23.
//

import Foundation

protocol FeatureARepositoryProtocol {
    func fetch() async throws -> [FeatureAModel]
    
    func fetch(completion: @escaping (Result<[FeatureAModel], FeatureAError>) -> Void)
}
