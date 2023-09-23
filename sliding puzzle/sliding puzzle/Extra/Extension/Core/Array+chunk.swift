//
//  Array+chunk.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/19/23.
//

import Foundation

extension Array {

    func chunked(by chunkSize:Int) -> [[Element]] {
        let groups = stride(from: 0, to: self.count, by: chunkSize)
            .map {
                Array(self[$0..<[$0 + chunkSize, self.count].min()!])
            }
        return groups
    }
}
