//
//  Array+PuzzleSolvable.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/26/23.
//

import Foundation

extension Array where Element == PuzzleItemModel {
    
    mutating func makePuzzleSolvable() {
        var firstIndex = 0
        var secondIndex = 0

        while firstIndex == secondIndex || self[firstIndex].isEmpty() || self[secondIndex].isEmpty() {
            firstIndex = Int.random(in: 0 ..< self.count)
            secondIndex = Int.random(in: 0 ..< self.count)
        }

        swapAt(firstIndex, secondIndex)
    }
}
