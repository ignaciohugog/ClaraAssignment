import SwiftUI

private struct SubheadLineStyle: ViewModifier {
    var font: Font = .subheadline
    var color: Color = .secondary

    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(color)
    }
}

public extension View {
    func subheadLineStyle() -> some View {
        self.modifier(SubheadLineStyle())
    }
}
