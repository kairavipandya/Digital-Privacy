import SwiftUI

struct MultiSelectDropdown: View {
    let options: [String]
    @State private var expanded = false
    @Binding var selectedOptions: Set<String>

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Select Profiles")
                .font(.custom("DMSans-Regular", size: 16))
            
            Button(action: {
                withAnimation {
                    expanded.toggle()
                }
            }) {
                HStack {
                    Text(selectedOptions.isEmpty ? "Select" : selectedOptions.joined(separator: ", "))
                        .foregroundColor(selectedOptions.isEmpty ? .gray : .black)
                        .font(.custom("DMSans-Regular", size: 16))
                    
                    Spacer()
                    Image(systemName: expanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
            }

            if expanded {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            if selectedOptions.contains(option) {
                                selectedOptions.remove(option)
                            } else {
                                selectedOptions.insert(option)
                            }
                        }) {
                            HStack {
                                Text(option)
                                    .font(.custom("DMSans-Regular", size: 16))
                                    .foregroundColor(.black)
                                Spacer()
                                if selectedOptions.contains(option) {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                }
                .padding(.vertical, 5)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 2)
            }
        }
    }
}

