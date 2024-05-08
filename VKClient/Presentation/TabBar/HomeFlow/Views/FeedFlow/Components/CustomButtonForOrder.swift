//
//  CustomButtonForOrder.swift
//  VKClient
//
//  Created by Viktoria Lobanova on 07.05.2024.
//

import SwiftUI

enum TypeButtonForRecord {
    case like
    case comment
    case forward
    case view
    
    var image: String {
        switch self {
        case .like:
            "heart"
        case .comment:
            "ellipsis.message"
        case .forward:
            "arrowshape.turn.up.forward"
        case .view:
            "eye"
        }
    }
}

struct CustomButtonForOrder: View {
    
    // MARK: - Properties
    
    @State private var liked: Bool = false
    let count: Int
    let typeButton: TypeButtonForRecord
    let action: () -> ()
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Image(systemName: typeButton.image)
                .resizable()
                .frame(
                    width: 12,
                    height: typeButton == .view ? 10 : 12
                )
                .foregroundStyle(
                    liked
                    ? Color.redUniversal.opacity(0.6)
                    : Color.blackUniversal.opacity(0.6)
                )
            
            if count > 0 {
                Text(String(count))
                    .foregroundStyle(
                        liked
                        ? Color.redUniversal.opacity(0.6)
                        : Color.blackUniversal.opacity(0.6)
                    )
                    .font(.system(size: 10))
            }
        }
        .padding(.horizontal, 10)
        .background(
            Rectangle()
                .foregroundStyle(
                    liked
                    ? Color.redUniversal.opacity(0.2)
                    : Color.grayLightUniversal.opacity(0.2)
                )
                .cornerRadius(14)
                .frame(height: 28)
        )
        .onTapGesture {
            typeButton == .like
            ? liked.toggle()
            : print("tapButton")
        }
    }
}

#Preview {
    CustomButtonForOrder(
        count: 10,
        typeButton: .like,
        action: {}
    )
}
