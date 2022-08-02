//
//  HabitStatistics.swift
//  Habit
//
//  Created by Vladimir Pisarenko on 02.08.2022.
//

import Foundation

struct HabitStatistics {
    let habit: Habit
    let userCounts: [UserCount]
}

extension HabitStatistics: Codable { }

struct UserCount {
    let user: User
    let count: Int
}

extension UserCount: Codable { }
extension UserCount: Hashable { }
