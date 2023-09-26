//
//  PuzzleItemModel.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/19/23.
//

import Foundation

struct PuzzleItemModel: Identifiable, Equatable, CustomStringConvertible {

    var content: Int
    var description: String {
        return content == 0 ? "" : "\(content)"
    }
    var id: Int { content }

    func isEmpty() -> Bool {
        return content == 0
    }

    static func == (lhs: PuzzleItemModel, rhs: PuzzleItemModel) -> Bool {
        lhs.id == rhs.id
    }
}
