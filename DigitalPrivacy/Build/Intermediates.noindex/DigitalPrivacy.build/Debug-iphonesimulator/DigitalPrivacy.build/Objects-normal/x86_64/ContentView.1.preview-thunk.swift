import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/arjunprabhune/Desktop/Classes/HCI/Digital-Privacy/DigitalPrivacy/DigitalPrivacy/ContentView.swift", line: 1)
//
//  ContentView.swift
//  DigitalPrivacy
//
//  Created by Kairavi Pandya on 10/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: __designTimeString("#4693_0", fallback: "globe"))
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(__designTimeString("#4693_1", fallback: "Hello, world!"))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
