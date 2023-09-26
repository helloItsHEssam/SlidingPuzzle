//
//  Coordinate.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/23/23.
//

import Foundation

struct Coordinate: Equatable {
    
    var row: Int
    var column: Int
    
    func neighbors() -> [Coordinate] {
        return [
            Coordinate(row: row - 1, column: column),
            Coordinate(row: row + 1, column: column),
            Coordinate(row: row, column: column - 1),
            Coordinate(row: row, column: column + 1)
        ]
    }
    
    static func == (lhs: Coordinate, rhs: Coordinate) -> Bool {
        lhs.row == rhs.row && lhs.column == rhs.column
    }
}
