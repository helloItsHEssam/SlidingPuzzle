//
//  TestArrayCountPuzzleItemInversion.swift
//  sliding puzzleTests
//
//  Created by Hessam Mahdiabadi on 9/26/23.
//

import XCTest
@testable import sliding_puzzle

final class TestArrayCountPuzzleItemInversion: XCTestCase {

    func testCountInversion() {
        
        // given
        let puzzleItems = [3, 1, 2]
            .map { PuzzleItemModel(content: $0) }
        let puzzleItems2 = [3, 1, 2, 0, 5]
            .map { PuzzleItemModel(content: $0) }
        
        // when
        let countInversion = puzzleItems.countInversions()
        let countInversion2 = puzzleItems2.countInversions()
        
        // then
        XCTAssertEqual(countInversion, 2)
        XCTAssertEqual(countInversion2, 2)
    }
}
