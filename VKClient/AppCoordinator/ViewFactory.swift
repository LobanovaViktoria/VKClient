//
//  ViewFactory.swift
//  VK
//
//  Created by Viktoria Lobanova on 02.05.2024.
//

import Foundation
import SwiftUI

class ViewFactory: ObservableObject {
   
    @ViewBuilder static func viewForDestination(_ destination: DestinationFlowPage) -> some View {
        switch destination {
       
        case .login:
            self.getToken()
        case .tabBar:
            self.getTabBar()
        }
    }
    
    static func getToken() -> some View {
        LoginView()
            .ignoresSafeArea(.all)
    }
    
    static func getTabBar() -> some View {
        TabBarView()
            .ignoresSafeArea(.all)
    }
}


