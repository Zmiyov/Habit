//
//  UserStatistics.swift
//  Habit
//
//  Created by Vladimir Pisarenko on 04.08.2022.
//

import Foundation

struct UserStatistics {
    let user: User
    let habitCounts: [HabitCount]
}

extension UserStatistics: Codable { }
