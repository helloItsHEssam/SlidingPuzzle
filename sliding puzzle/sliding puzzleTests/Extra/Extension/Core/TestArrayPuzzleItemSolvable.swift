//
//  TestArrayPuzzleItemSolvable.swift
//  sliding puzzleTests
//
//  Created by Hessam Mahdiabadi on 9/26/23.
//

import XCTest
@testable import sliding_puzzle

final class TestArrayPuzzleItemSolvable: XCTestCase {

    func testSolvablePuzzle() {
        
        // given
        let puzzleSolvableItems = [1, 2, 4, 3, 5, 7, 6, 8, 0]
            .map { PuzzleItemModel(content: $0) }
        let puzzleNotSolvableItems = [1, 2, 4, 5, 3, 7, 6, 8, 0]
            .map { PuzzleItemModel(content: $0) }
        var puzzleNotSolvablebutConvertToSolvableItems = [1, 2, 4, 5, 3, 7, 6, 8, 0]
            .map { PuzzleItemModel(content: $0) }
        
        // when
        let countInversion = puzzleSolvableItems.countInversions()
        let isSolvablePuzzle = countInversion % 2 == 0
        
        let countInversion2 = puzzleNotSolvableItems.countInversions()
        let isSolvablePuzzle2 = countInversion2 % 2 == 0
        
        puzzleNotSolvablebutConvertToSolvableItems.makePuzzleSolvable()
        let countInversion3 = puzzleNotSolvablebutConvertToSolvableItems.countInversions()
        let isSolvablePuzzle3 = countInversion3 % 2 == 0
                
        // then
        XCTAssertTrue(isSolvablePuzzle)
        XCTAssertFalse(isSolvablePuzzle2)
        XCTAssertTrue(isSolvablePuzzle3)
    }
}
