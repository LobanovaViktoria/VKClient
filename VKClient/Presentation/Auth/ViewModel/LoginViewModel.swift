//
//  LoginViewModel.swift
//  VK
//
//  Created by Viktoria Lobanova on 03.05.2024.
//

import SwiftUI


//let accessToken = ""

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
