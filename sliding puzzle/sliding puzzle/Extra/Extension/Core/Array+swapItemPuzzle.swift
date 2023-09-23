//
//  Array+swapItemPuzzle.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/23/23.
//

import Foundation

extension Array where Element == [PuzzleItemModel] {

    mutating func swapAt(_ i: Coordinate, _ j: Coordinate) {
        let tempItem = self[i.row][i.column]
        self[i.row][i.column] = self[j.row][j.column]
        self[j.row][j.column] = tempItem
    }
}
