//
//  HabitCount.swift
//  Habit
//
//  Created by Vladimir Pisarenko on 04.08.2022.
//

import Foundation

struct HabitCount {
    let habit: Habit
    let count: Int
}

extension HabitCount: Codable { }
extension HabitCount: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(habit)
    }
    
    static func ==(_ lhs: HabitCount, _ rhs: HabitCount) -> Bool {
        return lhs.habit == rhs.habit
    }
}
