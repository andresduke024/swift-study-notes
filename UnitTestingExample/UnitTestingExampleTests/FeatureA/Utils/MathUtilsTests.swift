//
//  MathUtilsTests.swift
//  UnitTestingExampleTests
//
//  Created by Andres Duque on 14/10/23.
//

import XCTest
@testable import UnitTestingExample

final class MathUtilsTests: XCTestCase {

    func testSumSuccess() {
        // Arrange
        let expected = 5
        
        // Act
        let result = MathUtils.sum(a: 2, b: 3)
        
        //Assert
        XCTAssertEqual(result, expected)
    }
}
