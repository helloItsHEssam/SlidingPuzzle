//
//  Poppins.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/18/23.
//

import Foundation

struct Poppins {
    
    enum Weight: CustomStringConvertible {
        case regular
        case bold
        case extraBold

        var description: String {
            var weight: String
            switch self {
            case .regular: weight = "Regular"
            case .bold: weight = "Bold"
            case .extraBold: weight = "ExtraBold"
            }
            
            return "Poppins-" + weight
        }
    }
    
    static func weight(_ weight: Weight) -> String {
        return weight.description
    }
}
