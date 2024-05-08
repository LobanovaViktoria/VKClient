import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var coordinator: BaseCoordinator
    @EnvironmentObject var loginViewModel: LoginViewModel
    @State var selectionSegment = 0
    @StateObject var viewModel = HomeViewModel()
    
    private let title = String(
        format: NSLocalizedString(
            "tabHome",
            comment: ""
        )
    )
    private let navFeed = String(
        format: NSLocalizedString(
            "navFeed",
            comment: ""
        )
    )
    private let navForYou = String(
        format: NSLocalizedString(
            "navForYou",
            comment: ""
        )
    )
    private let navNews = String(
        format: NSLocalizedString(
            "navNews",
            comment: ""
        )
    )
    
    //MARK: - Body
    
    var body: some View {
        let filterOptions: [String] = [navFeed, navForYou, navNews]
        
        ZStack {
            Color.white100Black70
                .ignoresSafeArea()
            VStack {
                CustomNavBar(
                    avatar: viewModel.avatarURL,
                    title: title,
                    imageForLeftButton: "plus.circle",
                    imageForMiddleButton: "magnifyingglass",
                    imageForRightButton: "bell"
                )
                .padding(.horizontal, 16)
                
                Picker("",selection: $selectionSegment) {
                    ForEach(filterOptions.indices, id: \.self) { index in
                        Text(filterOptions[index])
                            .tag(filterOptions[index])
                    }
                }
                .padding(.horizontal, 16)
                .pickerStyle(.segmented)
                
                switch selectionSegment {
                case 0: FeedView()
                case 1: ForYouView()
                case 2: NewsView()
                default: Text("")
                }
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

//MARK: - Preview

#Preview {
    HomeView()
}
