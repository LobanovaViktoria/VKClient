import Foundation

struct UserResponse: Codable {
    var response: [User]
}

struct User: Codable {
    var photo: String
    var firstName: String
    var lastName: String
    
    enum CodingKeys: String, CodingKey {
        case photo = "photo_100"
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
