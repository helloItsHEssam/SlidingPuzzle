//
//  TestCoordinate.swift
//  sliding puzzleTests
//
//  Created by Hessam Mahdiabadi on 9/26/23.
//

import XCTest
@testable import sliding_puzzle

final class TestCoordinate: XCTestCase {

    func testCoordinate() {
        
        // given
        let coordinate = Coordinate(row: 1, column: 0)
        
        // then
        XCTAssertEqual(coordinate.row, 1)
        XCTAssertEqual(coordinate.column, 0)
    }
    
    func testNeighborsOfCoordinate() {
        
        // given
        let coordinate = Coordinate(row: 1, column: 0)
        
        // when
        let neighbors = coordinate.neighbors()
        
        // then
        XCTAssertEqual(neighbors.count, 4)
        XCTAssertEqual(neighbors.first, Coordinate(row: 0, column: 0))
        XCTAssertEqual(neighbors[1], Coordinate(row: 2, column: 0))
        XCTAssertEqual(neighbors[2], Coordinate(row: 1, column: -1))
        XCTAssertEqual(neighbors.last, Coordinate(row: 1, column: 1))
    }

}
