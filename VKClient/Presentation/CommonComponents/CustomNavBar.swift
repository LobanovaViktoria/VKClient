import SwiftUI

struct CustomNavBar: View {
    
    //MARK: - Properties
    
    let avatar: String
    let title: String
    let imageForLeftButton: String
    let imageForMiddleButton: String
    let imageForRightButton: String
    
    //MARK: - Body
    
    var body: some View {
        
        HStack {
            AsyncImage(url: URL(string: avatar)) { phase in
                       switch phase {
                       case .failure:
                           Image(systemName: "photo")
                               .font(.largeTitle)
                       case .success(let image):
                           image
                               .resizable()
                       default:
                           ProgressView()
                       }
                   }
                   .frame(width: 20, height: 20)
                   .clipShape(Circle())
           
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(Color.black100White100)
            Spacer()
            HStack(spacing: 15) {
                Image(systemName: imageForLeftButton)
                Image(systemName: imageForMiddleButton)
                Image(systemName: imageForRightButton)
            }
            .foregroundStyle(Color.blueUniversal)
        }
    }
}

// MARK: - Preview

#Preview {
    CustomNavBar(
        avatar: "avatar",
        title: "Title",
        imageForLeftButton: "plus.circle",
        imageForMiddleButton: "magnifyingglass",
        imageForRightButton: "bell"
    )
}
