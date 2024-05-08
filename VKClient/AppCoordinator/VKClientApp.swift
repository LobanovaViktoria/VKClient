import SwiftUI

@main
struct VKClientApp: App {
    
        @ObservedObject var coordinator = BaseCoordinator()
      
        var body: some Scene {
            WindowGroup {
                bodyContentView()
            }
        }
        
        @ViewBuilder
        private func bodyContentView() -> some View {
            
                NavigationStack(path: $coordinator.path) {
                    ZStack {
                        appContent()
                            .sheet(item: $coordinator.presentSheetItem) { present in
                                ViewFactory.viewForDestination(present)
                            }
                            .fullScreenCover(item: $coordinator.fullCoverItem) { present in
                                ViewFactory.viewForDestination(present)
                            }
                    }
                    .navigationDestination(for: DestinationFlowPage.self) { destination in
                        ViewFactory.viewForDestination(destination)
                    }
                }
                .environmentObject(coordinator)
            }
        
        @ViewBuilder func appContent() -> some View {
            ViewFactory.getToken()
        }
    }
