//
//  AppCommunicator.swift
//  VK
//
//  Created by Viktoria Lobanova on 02.05.2024.
//

import Foundation
import SwiftUI

final class BaseCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var presentSheetItem: DestinationFlowPage?
    @Published var fullCoverItem: DestinationFlowPage?
    
    func gotoRoot() {
        path.removeLast(path.count)
    }
    
    func removeLast() {
        path.removeLast()
    }
}

protocol VKNavigator {
   
}

extension BaseCoordinator: VKNavigator {

}

enum DestinationFlowPage: Hashable, Identifiable {
    static func == (lhs: DestinationFlowPage, rhs: DestinationFlowPage) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    case login
    case tabBar
    
    var id: String {
        String(describing: self)
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .login:
            hasher.combine("login")
        case .tabBar:
            hasher.combine("tabBar")
        }
    }
}

protocol AnyDataModel {
    var data: Any? { get set }
    var index: Int? { get set }
    var id: String? { get set }
}


