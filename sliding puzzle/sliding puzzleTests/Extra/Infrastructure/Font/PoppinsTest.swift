//
//  PoppinsTest.swift
//  sliding puzzleTests
//
//  Created by Hessam Mahdiabadi on 9/26/23.
//

import XCTest
@testable import sliding_puzzle

final class PoppinsTest: XCTestCase {
    
    func testWeight() {
        
        // when
        let boldFont = Poppins.weight(.bold)
        
        // then
        XCTAssertEqual(boldFont, "Poppins-Bold")
        XCTAssertNotEqual(boldFont, "Poppins-Regular")
        XCTAssertNotEqual(boldFont, "Poppins-ExtraBold")        
    }

}
