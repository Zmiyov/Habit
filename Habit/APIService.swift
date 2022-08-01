//
//  APIService.swift
//  Habit
//
//  Created by Vladimir Pisarenko on 30.07.2022.
//

import Foundation

struct HabitRequest: APIRequest {
    typealias Response = [String: Habit]
    
    var habitName: String?
    
    var path: String { "/habits" }
}


