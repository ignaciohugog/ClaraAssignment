import Kingfisher
import SwiftUI

public struct RemoteImage: View {
    let url: URL?
    let placeholder: Image = Image(systemName: "photo")

    public init(url: URL?) {
        self.url = url
    }
    
    public var body: some View {
        KFImage(url)
            .placeholder {
                placeholder
            }
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipped()
    }
}
