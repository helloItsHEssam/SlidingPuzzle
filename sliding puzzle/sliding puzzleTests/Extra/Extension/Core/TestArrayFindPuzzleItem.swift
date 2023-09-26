//
//  TestArrayFindPuzzleItem.swift
//  sliding puzzleTests
//
//  Created by Hessam Mahdiabadi on 9/26/23.
//

import XCTest
@testable import sliding_puzzle

final class TestArrayFindPuzzleItem: XCTestCase {

    func testFindEmptyNeighbor() {
        
        // given
        let puzzleItems = [1, 2, 4, 3, 5, 7, 6, 8, 0]
            .map { PuzzleItemModel(content: $0) }
            .chunked(by: 3)
        
        let notEmptyNeighbor = Coordinate(row: 0, column: 0)
        let hasEmptyNeighbor = Coordinate(row: 2, column: 1)
        
        // when
        let emptyNeighborCoordinate = puzzleItems.findEmptyNeighbor(at: notEmptyNeighbor)
        let emptyNeighborForSecondCoordinate = puzzleItems.findEmptyNeighbor(at: hasEmptyNeighbor)
        
        // then
        XCTAssertNil(emptyNeighborCoordinate)
        XCTAssertNotNil(emptyNeighborForSecondCoordinate)
    }
    
    func testFindCoordinate() {
        
        // given
        let puzzleItems = [1, 2, 4, 3, 5, 7, 6, 8, 0]
            .map { PuzzleItemModel(content: $0) }
            .chunked(by: 3)
        let item = puzzleItems[1][2]
        let fakeItem = PuzzleItemModel(content: 10)
        
        // when
        let coordinate = puzzleItems.findCoordinate(of: item)
        let fakeCoordinate = puzzleItems.findCoordinate(of: fakeItem)
        
        // then
        XCTAssertEqual(coordinate, .init(row: 1, column: 2))
        XCTAssertNil(fakeCoordinate)
    }
}
