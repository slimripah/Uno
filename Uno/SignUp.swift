//
//  SignUp.swift
//  Uno
//
//  Created by Joe on 11/02/2026.
//

import SwiftUI

struct SignUp: View {
    @FocusState var isActive
    @Binding var email: String
    @Binding var Password: String
    @Binding var Remember: Bool
    @Binding var showSignIn: Bool
    var action:() -> Void
    var body: some View {
        Text("Hello, World")
    }
}

#Preview {
    HomeView()
}
