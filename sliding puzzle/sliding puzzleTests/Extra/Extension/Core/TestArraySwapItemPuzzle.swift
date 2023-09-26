//
//  TestArraySwapItemPuzzle.swift
//  sliding puzzleTests
//
//  Created by Hessam Mahdiabadi on 9/26/23.
//

import XCTest
@testable import sliding_puzzle

final class TestArraySwapItemPuzzle: XCTestCase {

    func testSwapPuzzleItem() {
        
        // given
        var array = [[PuzzleItemModel(content: 1), PuzzleItemModel(content: 2)],
                     [PuzzleItemModel(content: 3), PuzzleItemModel(content: 4)],]
        
        // when
        array.swapAt(Coordinate.init(row: 0, column: 1), .init(row: 1, column: 1))
        
        // then
        XCTAssertEqual(array[0][1].content, 4)
    }
}
