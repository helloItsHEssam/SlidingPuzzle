//
//  TestArrayChunk.swift
//  sliding puzzleTests
//
//  Created by Hessam Mahdiabadi on 9/26/23.
//

import XCTest
@testable import sliding_puzzle

final class TestArrayChunk: XCTestCase {

    func testChunkArray() {
        
        // given
        let arrayBasedOnEvenMember = [2, 3, 4, 5, 6, 6]
        let arrayBasedOnOddMember = [2, 3, 4, 5, 6, 6, 8]
        
        // when
        let chunkedArrayBasedOnEvenMember = arrayBasedOnEvenMember.chunked(by: 2)
        let chunkedArrayBasedOnOddMember = arrayBasedOnOddMember.chunked(by: 2)
        
        // then
        XCTAssertEqual(chunkedArrayBasedOnEvenMember.count, 3)
        XCTAssertEqual(chunkedArrayBasedOnEvenMember.first?.count, 2)
        XCTAssertEqual(chunkedArrayBasedOnOddMember.count, 4)
        XCTAssertEqual(chunkedArrayBasedOnOddMember.last?.count, 1)        
    }
}
