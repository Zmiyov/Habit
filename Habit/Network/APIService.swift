//
//  APIService.swift
//  Habit
//
//  Created by Vladimir Pisarenko on 30.07.2022.
//

import UIKit

struct HabitRequest: APIRequest {
    typealias Response = [String: Habit]
    
    var habitName: String?
    
    var path: String { "/habits" }
}

struct UserRequest: APIRequest {
    typealias Response = [String: User]
    
    var path: String { "/users" }
}

struct HabitStatisticsRequest: APIRequest {
    typealias Response = [HabitStatistics]
    
    var habitNames: [String]?
    
    var path: String { "/habitStats"}
    
    var queryItems: [URLQueryItem]? {
        if let habitNames = habitNames {
            return [URLQueryItem(name: "names", value: habitNames.joined(separator: ","))]
        } else {
            return nil
        }
    }
}

struct UserStatisticsRequest: APIRequest {
    typealias Response = [UserStatistics]
    
    var userIDs: [String]?
    
    var path: String { "/userStats" }
    
    var queryItems: [URLQueryItem]? {
        if let userIDs = userIDs {
            return [URLQueryItem(name: "ids", value: userIDs.joined(separator: ","))]
        } else {
            return nil
        }
    }
}

struct HabitLeadStatisticsRequest: APIRequest {
    typealias Response = UserStatistics
    
    var userID: String
    
    var path: String { "/userLeadingStats/\(userID)" }
}

struct ImageRequest: APIRequest {
    typealias Response = UIImage
    
    var imageID: String
    
    var path: String { "/images/" + imageID}
}
