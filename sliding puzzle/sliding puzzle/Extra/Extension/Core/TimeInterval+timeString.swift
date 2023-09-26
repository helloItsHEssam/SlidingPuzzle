//
//  TimeInterval+timeString.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/23/23.
//

import Foundation

extension TimeInterval {
    
    func createTime(_ formatter: DateComponentsFormatter) -> String {
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = [.pad]
        return formatter.string(from: self)!
    }
}
