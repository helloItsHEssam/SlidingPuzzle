//
//  Array+puzzleItemFind.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/26/23.
//

import Foundation

extension Array where Element == [PuzzleItemModel] {
    
    func findCoordinate(of item: PuzzleItemModel) -> Coordinate? {
        for (rowIndex, row) in self.enumerated() {
            if let columnIndex = row.firstIndex(of: item) {
                return Coordinate(row: rowIndex, column: columnIndex)
            }
        }
        return nil
    }

    func findEmptyNeighbor(at coordinate: Coordinate) -> Coordinate? {
        for coord in coordinate.neighbors() {
            if coord.row >= 0 && coord.row < self.count
                && coord.column >= 0 && coord.column < self[0].count {
                if self[coord.row][coord.column].isEmpty() {
                    return coord
                }
            }
        }
        return nil
    }
}
