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

#Preview {
    RemoteImage(
        url: URL(string: "https://i.discogs.com/KydDnAWdAzeHy0dZ4YSnpkuh__uLXIk8w60uKQVW0G4/rs:fit/g:sm/q:40/h:150/w:150/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9BLTEyNTI0/Ni0xNTAxMjg1MjAw/LTMwNTguanBlZw.jpeg")
    )
    .frame(width: 60, height: 60)
    .cornerRadius(10)
    .shadow(radius: 5)
}

