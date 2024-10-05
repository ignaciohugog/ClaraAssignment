import SwiftUI

private struct HeadlineStyle: ViewModifier {
    var font: Font = .headline
    var color: Color = .primary

    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(color)
    }
}

public extension View {
    func headlineStyle() -> some View {
        self.modifier(HeadlineStyle())
    }
}
