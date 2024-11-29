import SwiftUI

struct MultiSelectView: View {
    let options: [String]
    @Binding var selectedOptions: Set<String> // Binding to allow updates to the parent view

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    if selectedOptions.contains(option) {
                        selectedOptions.remove(option) // Deselect if already selected
                    } else {
                        selectedOptions.insert(option) // Select if not already selected
                    }
                }) {
                    HStack {
                        Text(option)
                            .font(.custom("DMSans-Regular", size: 16))
                        Spacer()
                        if selectedOptions.contains(option) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.blue)
                        } else {
                            Image(systemName: "circle")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.vertical, 8)
            }
        }
        .padding()
    }
}

// Preview
struct MultiSelectView_Previews: PreviewProvider {
    static var previews: some View {
        MultiSelectView(
            options: ["Instagram", "Snapchat", "Facebook", "Twitter"],
            selectedOptions: .constant(["Facebook", "Twitter"]) // Example preview values
        )
    }
}
