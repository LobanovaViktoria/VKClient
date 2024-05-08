import SwiftUI

struct VideosView: View {
    
    // MARK: - Properties

    private let title = String(
        format: NSLocalizedString(
            "tabVideos",
            comment: ""
        )
    )
    
    //MARK: - Body
    
    var body: some View {
        ZStack {
            Color.white100Black70
            VStack {
                CustomNavBar(
                    avatar: "avatar",
                    title: title,
                    imageForLeftButton: "",
                    imageForMiddleButton: "",
                    imageForRightButton: ""
                )
                .padding(.horizontal, 16)
                Spacer()
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

// MARK: - Preview

#Preview {
    VideosView()
}
