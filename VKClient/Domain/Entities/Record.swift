import Foundation

struct Record: Equatable, Identifiable {
    let id: UUID
    let image: String
    let author: String
    let date: String
    let description: String
    let photos: [String]
    let likes: Int
    let comments: Int
    let forwards: Int
    let views: Int
}

