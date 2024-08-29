//
//  Item.swift
//  TestingMVVM
//
//  Created by Conner Yoon on 8/29/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
