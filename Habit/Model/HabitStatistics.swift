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
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(user)
    }
    
    static func ==(_ lhs: UserCount, _ rhs: UserCount) -> Bool {
        return lhs.user == rhs.user
    }
}

extension UserCount: Codable { }
extension UserCount: Hashable { }
