import Foundation

struct FriendsResponse: Decodable {
    var response: Friends
}

struct Friends: Decodable {
    var items: [Friend]
}

struct Friend: Decodable {
    var photo: String
    var firstName: String
    var lastName: String
    
    enum CodingKeys: String, CodingKey {
        case photo = "photo_50"
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
