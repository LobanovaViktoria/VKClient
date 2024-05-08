import SwiftUI

struct RecordView: View {
    
    // MARK: - Properties
    
    @State private var showFullDescription: Bool = false
    private let less = String(
        format: NSLocalizedString(
            "less",
            comment: ""
        )
    )
    private let showMore = String(
        format: NSLocalizedString(
            "showMore",
            comment: ""
        )
    )
    let record: Record
    
    // MARK: - Body
    
    var body: some View {
        
        VStack {
            header
                .padding(.horizontal, 16)
                .padding(.top, 8)
            description
                .padding(.horizontal, 16)
            photos
            footer
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
        }
        .background(
            Rectangle()
                .foregroundColor(Color.white100Black70)
                .cornerRadius(15)
        )
    }
}

// MARK: - Extension

extension RecordView {
    private var header: some View {
        HStack {
            Image(record.image)
                .resizable()
                .frame(
                    width: 30,
                    height: 30
                )
                .clipShape(Circle())
            VStack {
                Text(record.author)
                    .font(.system(size: 12).bold())
                    .foregroundStyle(Color.black100White100)
                Text(record.date)
                    .font(.system(size: 10))
                    .foregroundStyle(Color.black100White100).opacity(0.5)
            }
            Spacer()
            Image(systemName: "ellipsis")
                .foregroundStyle(Color.black100White100).opacity(0.5)
        }
    }
    
    private var description: some View {
        VStack(spacing: 0) {
            Text(record.description)
                .font(.system(size: 12))
                .foregroundStyle(Color.black100White100)
                .lineLimit(showFullDescription ? nil : 2)
            HStack {
                Spacer()
                Button {
                    withAnimation(.easeInOut) {
                        showFullDescription.toggle()
                    }
                } label: {
                    Text(showFullDescription ? less : showMore)
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding(.vertical, 4)
                }
                .accentColor(Color.blueUniversal)
                .padding(.bottom, 0)
            }
        }
    }
    
    private var photos: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100, maximum: 300))]) {
            ForEach(record.photos.indices, id: \.self) { index in
                Image(record.photos[index])
                    .resizable()
                    .scaledToFill()
            }
        }
    }
    
    private var footer: some View {
        HStack {
            CustomButtonForOrder(
                count: record.likes,
                typeButton: .like) {
                    
                }
            CustomButtonForOrder(
                count: record.comments,
                typeButton: .comment) {
                    
                }
            CustomButtonForOrder(
                count: record.forwards,
                typeButton: .forward) {
                    
                }
            Spacer()
            CustomButtonForOrder(
                count: record.forwards,
                typeButton: .view) {
                    
                }
        }
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        Color.grayLightUniversal
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
        .padding()
    }
}
