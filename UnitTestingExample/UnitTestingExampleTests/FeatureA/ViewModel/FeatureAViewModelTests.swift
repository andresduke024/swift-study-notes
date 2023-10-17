//
//  FeatureAViewModelTests.swift
//  UnitTestingExampleTests
//
//  Created by Andres Duque on 14/10/23.
//

import XCTest
@testable import UnitTestingExample

final class FeatureAViewModelTests: XCTestCase {

    private var sut: FeatureAViewModel!
    
    private var mockRepository: MockFeatureARepository!
    private var mockBinding: MockFeatureAViewModelBinding!
    
    override func setUpWithError() throws {
        mockRepository = MockFeatureARepository()
        mockBinding = MockFeatureAViewModelBinding()
        
        sut = FeatureAViewModel(repository: mockRepository)
        sut.setBinding(mockBinding)
    }

    override func tearDownWithError() throws {
        mockRepository = nil
        mockBinding = nil
        sut = nil
    }
    
    func testGetDataAsyncSuccess() async {
        // Arrange
        mockRepository.resultAsync = []
        
        // Act
        await sut.getDataAsync()
        
        // Assert
        XCTAssert(mockBinding.dataLoadedWasCalled)
    }
    
    func testGetDataAsyncFail() async {
        // Arrange
        mockRepository.resultAsync = nil
        
        // Act
        await sut.getDataAsync()
        
        // Assert
        XCTAssert(mockBinding.errorOnDataLoadWasCalled)
    }
}

final class MockFeatureAViewModelBinding: FeatureAViewModelBinding {
    
    var dataLoadedWasCalled: Bool = false
    func dataLoaded(_ data: [UnitTestingExample.FeatureAModel]) {
        dataLoadedWasCalled = true
    }
    
    var errorOnDataLoadWasCalled: Bool = false
    func errorOnDataLoad(_ error: UnitTestingExample.FeatureAError) {
        errorOnDataLoadWasCalled = true
    }
}

final class MockFeatureARepository: FeatureARepositoryProtocol {
    
    var resultAsync: [FeatureAModel]?
    func fetch() async throws -> [FeatureAModel] {
        if let resultAsync { return resultAsync }
        
        throw FeatureAError.generic
    }
    
    func fetch(completion: @escaping (Result<[FeatureAModel], FeatureAError>) -> Void) {
    
    }
}
