import SwiftUI

// TODO: Create and move to UI Module
struct EmptyModel {
    var title: String
    var systemImage: String
    var description: String
}

struct EmptyContentView: View {
    var model: EmptyModel

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: model.systemImage)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.gray)

            Text(model.title)
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)

            Text(model.description)
                .font(.body)
                .multilineTextAlignment(.center)
        }
        .padding()
        .foregroundColor(.secondary)
    }
}
