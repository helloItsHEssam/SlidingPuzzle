//
//  Array+countPuzzleItemInversion.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/26/23.
//

import Foundation

extension Array where Element == PuzzleItemModel {
    
    func countInversions() -> Int {
        var inversions = 0
        for i in 0 ..< self.count - 1 {
            for j in i + 1 ..< self.count {
                if self[i] > self[j] && !self[i].isEmpty() && !self[j].isEmpty() {
                    inversions += 1
                }
            }
        }
        return inversions
    }
}
