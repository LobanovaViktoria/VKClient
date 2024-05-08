import SwiftUI

struct LoginView: View {
   
    //MARK: - Properties
    
    @ObservedObject var loginViewModel = LoginViewModel()
    @EnvironmentObject var coordinator: BaseCoordinator
    
    //MARK: - Body
    
    var body: some View {
        VStack {
            if loginViewModel.isLogin {
                ViewFactory.getTabBar()
                    .environmentObject(loginViewModel)
                    .ignoresSafeArea(.all)
            } else {
                WebView(token: $loginViewModel.token)
                    .ignoresSafeArea(.all)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    LoginView()
}
