//
//  LoggedHabit.swift
//  Habit
//
//  Created by Vladimir Pisarenko on 06.08.2022.
//

import Foundation

struct LoggedHabit {
    let userID: String
    let habitName: String
    let timestamp: Date
}

extension LoggedHabit: Codable { }

