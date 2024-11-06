import SwiftUI

struct PrivacyProfilesView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Manage Privacy Profiles")
                        .font(.custom("DMSans-Bold", size: 24))
                        .padding(.top, 16)
                    Spacer()
                    // NavigationLink for the "+" button to navigate to CreatePrivacyProfileView
                    NavigationLink(destination: CreatePrivacyProfileView()) {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }
                    .padding(.top, 16)
                }
                .padding(.horizontal)

                List {
                    NavigationLink(destination: Text("Personal Profile Settings")) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Personal Profile")
                                    .font(.custom("DMSans-Bold", size: 18))
                                    .foregroundColor(.black)
                                Text("Configure privacy settings for personal time")
                                    .font(.custom("DMSans-Regular", size: 16))
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 8)
                    }
                    .listRowBackground(Color.white)

                    Toggle("Online Status", isOn: .constant(false))
                        .toggleStyle(SwitchToggleStyle(tint: Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255)))
                        .padding(.vertical, 8)
                    
                    Toggle("Restrict Messaging", isOn: .constant(false))
                        .toggleStyle(SwitchToggleStyle(tint: Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255)))
                        .padding(.vertical, 8)
                    
                    Toggle("Post Notifications", isOn: .constant(false))
                        .toggleStyle(SwitchToggleStyle(tint: Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255)))
                        .padding(.vertical, 8)
                    
                    HStack {
                        Text("Activation Time")
                            .font(.custom("DMSans-Regular", size: 16))
                            .foregroundColor(.black)
                        Spacer()
                        Text("3:00 PM - 8:00 AM")
                            .font(.custom("DMSans-Regular", size: 16))
                            .foregroundColor(Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255))
                    }
                    .padding(.vertical, 8)
                }
                .listStyle(PlainListStyle())
                .background(Color.white)
            }
            .navigationTitle("Privacy Profiles")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
}

struct PrivacyProfilesView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyProfilesView()
    }
}
