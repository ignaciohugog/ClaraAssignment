import UI
import SwiftUI

struct SearcherCardView: View {
    let item: ArtistItem
    var body: some View {
        HStack(spacing: 15) {
            RemoteImage(url: item.image)
                .frame(width: 60, height: 60)
                .cornerRadius(12)
                .shadow(radius: 3)

            Text(item.name)
                .headlineStyle()

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(10)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}
