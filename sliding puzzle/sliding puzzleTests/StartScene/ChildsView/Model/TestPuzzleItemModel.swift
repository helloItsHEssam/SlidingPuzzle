//
//  TestPuzzleItemModel.swift
//  sliding puzzleTests
//
//  Created by Hessam Mahdiabadi on 9/26/23.
//

import XCTest
@testable import sliding_puzzle

final class TestPuzzleItemModel: XCTestCase {

    func testContent() {
        
        // given
        let item = PuzzleItemModel(content: 1)
        
        // when
        let content = item.content
        let id = item.id
        
        // then
        XCTAssertEqual(content, 1)
        XCTAssertEqual(id, 1)
    }
    
    func testDescription() {
        
        // given
        let item = PuzzleItemModel(content: 0)
        let item2 = PuzzleItemModel(content: 2)
        
        // when
        let description = String(describing: item)
        let description2 = String(describing: item2)
        
        // then
        XCTAssertEqual(description, "")
        XCTAssertEqual(description2, "2")
    }
    
    func testEmpty() {
        
        // given
        let item = PuzzleItemModel(content: 0)
        let item2 = PuzzleItemModel(content: 2)
        
        // when
        let isEmpty = item.isEmpty()
        let isEmpty2 = item2.isEmpty()
        
        // then
        XCTAssertTrue(isEmpty)
        XCTAssertFalse(isEmpty2)
    }

    func testEquatable() {
        
        // given
        let item = PuzzleItemModel(content: 3)
        let item2 = PuzzleItemModel(content: 3)
        
        // then
        XCTAssertEqual(item, item2)
    }
}
