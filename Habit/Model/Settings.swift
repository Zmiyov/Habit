//
//  Settings.swift
//  Habit
//
//  Created by Vladimir Pisarenko on 31.07.2022.
//

import Foundation

struct Settings {
    static var shared = Settings()
    private let defaults = UserDefaults.standard
    let currentUser = User(id: "activeUser", name: "Volodymyr Pysarenko", color: nil, bio: nil)
    
    var followedUsersIDs: [String] {
        get {
            return unarchiveJSON(key: Setting.followedUsersIDs) ?? []
        }
        set {
            archiveJSON(value: newValue, key: Setting.followedUsersIDs)
        }
    }
    
    var favoriteHabits: [Habit] {
        get {
            return unarchiveJSON(key: Setting.favoriteHabits) ?? []
        }
        set {
            archiveJSON(value: newValue, key: Setting.favoriteHabits)
        }
    }
    
    enum Setting {
        static let followedUsersIDs = "followedUsersIDs"
        static let favoriteHabits = "favoriteHabits"
    }
    
    private func archiveJSON<T: Encodable>(value: T, key: String) {
        let data = try! JSONEncoder().encode(value)
        let string = String(data: data, encoding: .utf8)
        defaults.set(string, forKey: key)
    }
    
    private func unarchiveJSON<T: Decodable>(key: String) -> T? {
        guard let string = defaults.string(forKey: key),
              let data = string.data(using: .utf8) else {
            return nil
        }
        return try! JSONDecoder().decode(T.self, from: data)
    }
    
    mutating func toggleFavorite(_ habit: Habit) {
        var favorites = favoriteHabits
        
        if favorites.contains(habit) {
            favorites = favorites.filter { $0 != habit }
        } else {
            favorites.append(habit)
        }
        
        favoriteHabits = favorites
    }
    
    mutating func toggleFollowed(user: User) {
        var updated = followedUsersIDs
        
        if updated.contains(user.id) {
            updated = updated.filter { $0 != user.id }
        } else {
            updated.append(user.id)
        }
        
        followedUsersIDs = updated
    }
    
}
