//
//  FeatureAViewModel.swift
//  UnitTestingExample
//
//  Created by Andres Duque on 14/10/23.
//

import Foundation

final class FeatureAViewModel: FeatureAViewModelProtocol {
    
    private let repository: FeatureARepositoryProtocol
    weak var binding: FeatureAViewModelBinding?
    
    init(repository: FeatureARepositoryProtocol = FeatureARepository()) {
        self.repository = repository
    }
    
    func setBinding(_ binding: FeatureAViewModelBinding) {
        self.binding = binding
    }
    
    func getDataAsync() async {
        do {
            let data = try await repository.fetch()
            binding?.dataLoaded(data)
        } catch let error as FeatureAError {
            binding?.errorOnDataLoad(error)
        } catch {
            binding?.errorOnDataLoad(FeatureAError.generic)
        }
    }

    func getDataClosure() {
        repository.fetch { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                self.binding?.dataLoaded(data)
            case .failure(let error):
                self.binding?.errorOnDataLoad(error)
            }
        }
    }
}
