//
//  TestGameViewModel.swift
//  sliding puzzleTests
//
//  Created by Hessam Mahdiabadi on 9/26/23.
//

import XCTest
@testable import sliding_puzzle

final class TestGameViewModel: XCTestCase {

    // given
    var viewModel: GameViewModel?
    
    override func setUp() {
        viewModel = .init()
        viewModel?.initializeGame()
    }
    
    override func tearDown() {
        viewModel = nil
    }

    func testInitilizeGame() {
        
        // when
        let items = viewModel?.items.flatMap { $0 }
        
        let countInversion = items?.countInversions() ?? 0
        let isSolvablePuzzle = countInversion % 2 == 0
        
        // then
        XCTAssertTrue(isSolvablePuzzle)
    }
    
    func testShiftPuzzleItem() {
        
        // given
        viewModel?.items = [5, 8, 7, 6, 0, 2, 4, 1, 3]
            .map {PuzzleItemModel(content: $0)}
            .chunked(by: 3)

        let itemNotHasEmptyNheibor = viewModel?.items[0][0]
        let itemHasEmptyNheibor = viewModel?.items[0][1]
        
        // when
        viewModel?.shiftPuzzleItem(itemNotHasEmptyNheibor!)
        viewModel?.shiftPuzzleItem(itemHasEmptyNheibor!)
        
        // then
        XCTAssertEqual(viewModel?.numberOfMoves, 1)
    }
    
    func testWrongIsSolved() {
        
        // given
        viewModel?.items = [1, 2, 3, 4, 5, 6, 7, 0, 8]
            .map {PuzzleItemModel(content: $0)}
            .chunked(by: 3)

        let itemShiftToNotSolve = viewModel?.items[2][0]
        
        // when
        viewModel?.shiftPuzzleItem(itemShiftToNotSolve!)
        
        // then
        XCTAssertFalse(viewModel?.isFinished ?? true)
    }
    
    func testIsSolved() {
        
        // given
        viewModel?.items = [1, 2, 3, 4, 5, 6, 7, 0, 8]
            .map {PuzzleItemModel(content: $0)}
            .chunked(by: 3)

        let itemShiftToSolve = viewModel?.items[2][2]
        
        // when
        viewModel?.shiftPuzzleItem(itemShiftToSolve!)
        
        // then
        XCTAssertTrue(viewModel?.isFinished ?? false)
    }
    
    func testResetGame() {
        
        // when
        viewModel?.resetGame()
        
        // then
        XCTAssertEqual(viewModel?.numberOfMoves, 0)
    }
}
