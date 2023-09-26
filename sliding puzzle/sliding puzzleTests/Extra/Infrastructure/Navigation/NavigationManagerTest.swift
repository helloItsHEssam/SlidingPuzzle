//
//  NavigationManagerTest.swift
//  sliding puzzleTests
//
//  Created by Hessam Mahdiabadi on 9/26/23.
//

import XCTest
@testable import sliding_puzzle

final class NavigationManagerTest: XCTestCase {
    
    // given
    var navigationManager: NavigationManager?
    
    override func setUp() {
        navigationManager = .init()
    }
    
    override func tearDown() {
        navigationManager = nil
    }
    
    func testIsEmptynavigationManager() {
        
        // then
        XCTAssertTrue(navigationManager?.isEmpty ?? false)
    }

    func testGoToGamePage() {
        
        // when
        navigationManager?.goToGamePage()
        
        // then
        XCTAssertFalse(navigationManager?.isEmpty ?? true)
    }
    
    func testBack() {
        
        // when
        navigationManager?.goToGamePage()
        navigationManager?.back()
        
        // then
        XCTAssertTrue(navigationManager?.isEmpty ?? false)
    }
    
    func testDoubleGoToGamePage() {
        
        // when
        navigationManager?.goToGamePage()
        navigationManager?.goToGamePage()
        
        // then
        XCTAssertEqual(navigationManager?.countOfPages, 2)
    }
    
    func testPopToRoot() {
        
        // when
        navigationManager?.goToGamePage()
        navigationManager?.goToGamePage()
        navigationManager?.popToRoot()
        
        // then
        XCTAssertEqual(navigationManager?.countOfPages, 0)
        XCTAssertTrue(navigationManager?.isEmpty ?? false)
    }
}
