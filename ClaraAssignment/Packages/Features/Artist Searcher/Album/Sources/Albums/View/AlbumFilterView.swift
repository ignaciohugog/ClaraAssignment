import SwiftUI

struct AlbumFilterView: View {
    @Binding var filter: AlbumFilter
    var action: () -> Void
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Year")) {
                        TextField("Enter year", text: $filter.year)
                            .keyboardType(.numberPad)
                    }

                    Section(header: Text("Genre")) {
                        TextField("Enter genre", text: $filter.genre)
                    }

                    Section(header: Text("Label")) {
                        TextField("Enter label", text: $filter.label)
                    }
                }

                Button(action: {
                    action()
                    dismiss()
                }) {
                    Text("Search")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                .padding(.bottom)
            }
            .navigationBarItems(trailing: Button("Close") {
                dismiss()
            })
        }
    }
}
