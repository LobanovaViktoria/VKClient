import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var avatarURL: String = ""
    private let userDataService: UserDataService
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.userDataService = UserDataService()
        addSubscribers()
    }
    
    private func addSubscribers() {
        userDataService.$userDetails
            .sink { [weak self] (returnedUserDetails) in
                self?.avatarURL = returnedUserDetails?.response[0].photo ?? "avatar"

            }
            .store(in: &cancellables)
    }
}
