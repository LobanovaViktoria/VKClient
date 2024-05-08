//
//  TabBarView.swift
//  VK
//
//  Created by Viktoria Lobanova on 02.05.2024.
//

import SwiftUI

struct TabBarView: View {
    
    @EnvironmentObject var coordinator: BaseCoordinator
    
    @State private var selectedTab = 0
    
    private let home = String(
        format: NSLocalizedString(
            "tabHome",
            comment: ""
        )
    )
    private let hub = String(
        format: NSLocalizedString(
            "tabHub",
            comment: ""
        )
    )
    private let chats = String(
        format: NSLocalizedString(
            "tabChats",
            comment: ""
        )
    )
    private let clips = String(
        format: NSLocalizedString(
            "tabClips",
            comment: ""
        )
    )
    private let videos = String(
        format: NSLocalizedString(
            "tabVideos",
            comment: ""
        )
    )
    var body: some View {
        content()
            .onAppear {
                UITabBar.appearance().barTintColor = UIColor.blueUniversal
                UITabBar.appearance().backgroundColor = UIColor.white100Black30
            }
    }
    
    @ViewBuilder private func content() -> some View {
        ZStack {
            TabView(selection: $selectedTab) {
                VStack(spacing: 0) {
                    HomeView()
                    dividerForTabBar
                }
                .tabItem {
                    Label(home,systemImage: "house")
                }
                .tag(0)
                
                VStack(spacing: 0) {
                    HubView()
                    dividerForTabBar
                }
                .tabItem {
                    Label(hub, systemImage: "square.grid.2x2")
                }
                .tag(1)
                
                VStack(spacing: 0) {
                    ChatsView()
                    dividerForTabBar
                }
                .tabItem {
                    Label(chats, systemImage: "message")
                }
                .tag(2)
                
                VStack(spacing: 0) {
                    ClipsView()
                    dividerForTabBar
                }
                .tabItem {
                    Label(clips, systemImage: "film")
                }
                .tag(3)
                
                VStack(spacing: 0) {
                    VideosView()
                    dividerForTabBar
                }
                .tabItem {
                    Label(videos, systemImage: "play.rectangle")
                }
                .tag(4)
            }
            .accentColor(Color.blueUniversal)
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

// MARK: - Extension

extension TabBarView {
    
    private var dividerForTabBar: some View {
        Divider()
            .background(Color.grayLightUniversal)
            .frame(height: 1)
    }
}

// MARK: - Preview

#Preview {
    TabBarView()
}
