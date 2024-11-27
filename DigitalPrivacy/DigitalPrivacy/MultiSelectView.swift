//
//  MultiSelectView.swift
//  DigitalPrivacy
//
//  Created by Kairavi Pandya on 11/27/24.
//

import SwiftUI

struct MultiSelectView: View {
    let options: [String]
    @Binding var selectedOptions: Set<String>

    var body: some View {
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
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.blue)
                        } else {
                            Image(systemName: "circle")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}
