//
//  Item.swift
//  InterviewChecker
//
//  Created by Mark Golubev on 28/05/2024.
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
