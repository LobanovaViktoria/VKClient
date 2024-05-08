import SwiftUI
import Combine

class UserDataService {
    @AppStorage("accessToken") private var accessToken: String?
    @Published var userDetails: UserResponse? = nil
    
    var userDetailSubscription: AnyCancellable?
    
    init() {
        getUserDetails()
    }
    
    func getUserDetails() {
        guard let url = URL(string: "https://api.vk.com/method/users.get?fields=photo_100&v=5.199") else { return }
        if let token = accessToken {
            userDetailSubscription = NetworkingManager.download(url: url, token: token)
                .decode(type: UserResponse.self, decoder: JSONDecoder())
                .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedUserDetails) in
                    self?.userDetails = returnedUserDetails
                    self?.userDetailSubscription?.cancel()
                })
        }
    }
}


