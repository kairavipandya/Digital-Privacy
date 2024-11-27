import SwiftUI

struct ProfileVisibilityView: View {
    @Binding var profileVisibility: String
    @Environment(\.presentationMode) var presentationMode // For dismissing the view
    @State private var showNotification = false // Show notification when changes are saved
    @State private var showConfirmationDialog = false // Show confirmation dialog before saving
    @State private var undoStack: [String] = [] // Stack to store previous states

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Profile Visibility")
                    .font(.custom("DMSans-Bold", size: 24))
                    .padding(.bottom, 20)

                Group {
                    ProfileVisibilityOption(
                        title: "Public",
                        isSelected: profileVisibility == "Public"
                    ) {
                        addToUndoStack()
                        profileVisibility = "Public"
                    }
                    ProfileVisibilityOption(
                        title: "Friends Only",
                        isSelected: profileVisibility == "Friends Only"
                    ) {
                        addToUndoStack()
                        profileVisibility = "Friends Only"
                    }
                    ProfileVisibilityOption(
                        title: "Private",
                        isSelected: profileVisibility == "Private"
                    ) {
                        addToUndoStack()
                        profileVisibility = "Private"
                    }
                    ProfileVisibilityOption(
                        title: "Deactivate",
                        isSelected: profileVisibility == "Deactivate",
                        isDangerous: true
                    ) {
                        addToUndoStack()
                        profileVisibility = "Deactivate"
                    }
                }
            }
            .padding()

            Spacer()

            HStack {
                // Undo Button
                if !undoStack.isEmpty {
                    Button(action: undoChange) {
                        Text("UNDO")
                            .font(.custom("DMSans-Bold", size: 16))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }

                // Save Button
                Button(action: {
                    showConfirmationDialog = true
                }) {
                    Text("SAVE CHANGES")
                        .font(.custom("DMSans-Bold", size: 16))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 30)
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .navigationBarTitle("Profile Visibility", displayMode: .inline)
        .overlay(
            Group {
                if showNotification {
                    NotificationView(message: "Profile visibility updated to \(profileVisibility)!")
                }
            }
        )
        .confirmationDialog(
            "Confirm Changes",
            isPresented: $showConfirmationDialog,
            titleVisibility: .visible
        ) {
            Button("Save Changes", role: .none) {
                saveChanges()
            }
            Button("Cancel", role: .cancel) {}
        }
    }

    private func addToUndoStack() {
        undoStack.append(profileVisibility)
    }

    private func undoChange() {
        if let lastState = undoStack.popLast() {
            profileVisibility = lastState
        }
    }

    private func saveChanges() {
        showNotification = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            showNotification = false
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ProfileVisibilityOption: View {
    var title: String
    var isSelected: Bool
    var isDangerous: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.custom("DMSans-Regular", size: 18))
                .foregroundColor(isSelected ? Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255) : (isDangerous ? .red : .gray))
                .padding()
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isSelected ? Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255) : (isDangerous ? .red : .gray), lineWidth: 2)
                )
        }
        .padding(.bottom, 10)
    }
}

struct NotificationView: View {
    let message: String

    var body: some View {
        Text(message)
            .font(.custom("DMSans-Bold", size: 16))
            .foregroundColor(.white)
            .padding()
            .background(Color.green)
            .cornerRadius(10)
            .shadow(radius: 10)
            .frame(maxWidth: .infinity)
            .padding()
            .transition(.opacity)
            .animation(.easeInOut)
    }
}
