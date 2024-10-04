import SwiftUI

public struct EmptyContentView: View {
    var model: EmptyModel

    public init(model: EmptyModel) {
        self.model = model
    }

    public var body: some View {
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
