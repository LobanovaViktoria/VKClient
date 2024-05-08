//
//  LoginView.swift
//  VK
//
//  Created by Viktoria Lobanova on 03.05.2024.
//

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
