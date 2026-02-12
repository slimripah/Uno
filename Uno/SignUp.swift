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
        VStack(spacing: 45){
            TopView(title: "Welcome back", details: "Please Sign In to your account")
            InfoTF(title: "Email", text: $email)
            VStack(spacing:24){
                PasswordTF(title: "Password", text: $Password)
                HStack{
                    Toggle(isOn: $Remember, label: {
                        Text("Label")
                    })
                    .toggleStyle(RememberStyle())
                    Spacer()
                    Button(action: {}, label: {
                        Text("Forget Password?").bold().font(.footnote)
                    })
                    .tint(.primary)
                }
            }
            SignButton(title: "Sign In", action: {})
            OrView(title: "or")
            HStack(spacing:65){
                signAccount(image: .apple, width: 32, height: 32, action: {})
                signAccount(image: .email, width: 32, height: 32, action: {})
                signAccount(image: .google, width: 32, height: 32, action: {})
            }
            Spacer()
            Button {
                email = ""
                Password = ""
                withAnimation{
                    showSignIn.toggle()
                }
            } label: {
            Text("Don't have an account? ***Sign Up***")
            }
            .tint(.primary)
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
