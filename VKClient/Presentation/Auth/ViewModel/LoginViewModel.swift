import SwiftUI

class LoginViewModel: ObservableObject {
    @AppStorage("accessToken") private var accessToken: String?
    
    @Published var isLogin = false
    @Published var token = "" {
        didSet {
            isLogin = true
            print("token:" + token)
            accessToken = token
        }
    }
}
