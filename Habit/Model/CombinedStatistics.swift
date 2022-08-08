//
//  CombinedStatistics.swift
//  Habit
//
//  Created by Vladimir Pisarenko on 07.08.2022.
//

import Foundation

struct CombinedStatistics {
    let userStatistics: [UserStatistics]
    let habitStatistics: [HabitStatistics]
}

extension CombinedStatistics: Codable { }

