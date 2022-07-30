//
//  Habit.swift
//  Habit
//
//  Created by Vladimir Pisarenko on 30.07.2022.
//

import Foundation
import CoreImage

struct Habit {
    let name: String
    let category: Category
    let info: String
}

struct Category {
    let name: String
    let color: Color
}

struct Color {
    let hue: Double
    let saturation: Double
    let brightness: Double
}

extension Color: Codable {
    enum CodingKeys: String, CodingKey {
        case hue = "h"
        case saturation = "s"
        case brightness = "b"
    }
}

extension Category: Codable { }
extension Habit: Codable { }
