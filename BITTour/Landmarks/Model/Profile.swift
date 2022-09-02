/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A representation of user profile data.
*/

import Foundation
import SwiftUI

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.summer
    var goalDate = Date()

    var major: String
    var school: String
    var profileImage: String
    var image: Image {
        Image(profileImage)
    }
    static let `default` = Profile(username: "Jaykef (苏杰)", major: "Software Engineering", school: "School of Computer Science & Technology", profileImage: "jaykef")

    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case autumn = "🍂"
        case winter = "☃️"
        case summer = "🌞"

        var id: String { self.rawValue }
    }
}
