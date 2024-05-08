import SwiftUI

struct FeedView: View {
    
    // MARK: - Properties
    
    //MARK: - Body
    
    var body: some View {
        ZStack {
            Color.grayLightUniversal.opacity(0.5)
                .ignoresSafeArea()
            ScrollView {
                stories
                RecordView(record:
                            Record(
                                id: UUID(),
                                image: "avatar",
                                author: "Author",
                                date: "01.01.2023",
                                description: "Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description",
                                photos: ["avatar", "iconVK", "avatar",
                                         "avatar", "iconVK", "iconVK", "iconVK",],
                                likes: 5,
                                comments: 10,
                                forwards: 15,
                                views: 100
                            )
                )
                
                RecordView(record:
                            Record(
                                id: UUID(),
                                image: "avatar",
                                author: "Author",
                                date: "01.01.2023",
                                description: "Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description",
                                photos: ["avatar", "iconVK", "avatar",
                                         "avatar", "iconVK", "iconVK", "iconVK",],
                                likes: 5,
                                comments: 10,
                                forwards: 15,
                                views: 100
                            )
                )
            }
            .scrollIndicators(.hidden)
            .ignoresSafeArea()
        }
    }
}

//MARK: - Extension

extension FeedView {
    private var stories: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(1...10, id: \.self) {_ in
                    ZStack {
                        Circle()
                            .stroke(Color.blueUniversal, lineWidth: 2)
                            .frame(
                                width: 85,
                                height: 85
                            )
                        Image("avatar")
                            .resizable()
                            .frame(
                                width: 80,
                                height: 80
                            )
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }
                }
            }
            .padding(16)
        }
        .background(
            Rectangle()
                .foregroundStyle(Color.white100Black70)
                .cornerRadius(14)
                .frame(height: 100)
        )
    }
}

//MARK: - Preview

#Preview {
    FeedView()
}
