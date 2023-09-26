//
//  TestTimeInterval.swift
//  sliding puzzleTests
//
//  Created by Hessam Mahdiabadi on 9/26/23.
//

import XCTest
@testable import sliding_puzzle

final class TestTimeInterval: XCTestCase {

    func testConvertTimeIntervalToString() {
        
        // given
        let formatter = DateComponentsFormatter()
        
        let firstTimeInterVal: TimeInterval = 100
        let secondTimeInterval: TimeInterval = 1
        
        // when
        let firstTimeString = firstTimeInterVal.createTime(formatter)
        let secondTimeString = secondTimeInterval.createTime(formatter)
        
        // then
        XCTAssertEqual(firstTimeString, "01:40")
        XCTAssertEqual(secondTimeString, "00:01")
    }
}
