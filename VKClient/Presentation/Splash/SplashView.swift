//
//  SplashView.swift
//  VK
//
//  Created by Viktoria Lobanova on 02.05.2024.
//

import SwiftUI

struct SplashView: View {
    
    @Binding var shouldShowSplash: Bool
    
    var body: some View {
        ZStack {
            Label {
                Text("вконтакте")
                    .font(.title)
                    .fontWeight(.semibold)
            } icon: {
                Image("iconVK")
            }

        }
        .onAppear {
            DispatchQueue.main.asyncAfter(
                deadline: .now() + 2) {
                    withAnimation {
                        self.shouldShowSplash = false
                    }
                }
        }
    }
}

#Preview {
    SplashView(shouldShowSplash: .constant(true))
}
