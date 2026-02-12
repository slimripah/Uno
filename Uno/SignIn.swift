//
//  SignIn.swift
//  Uno
//
//  Created by Joe on 11/02/2026.
//

import SwiftUI

struct SignIn: View {
    @FocusState var isActive
    @Binding var email:String
    @Binding var Password:String
    @Binding var Remember:Bool
    @Binding var showSignUp:Bool
    @State var showForgotView = false
    var action:() -> Void
    var body: some View {
        VStack(spacing: 45){
            TopView(title: "Welcome back", details: "Please Sign In to your account")
            InfoTF(title: "Email", text: $email)
            VStack{
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
        }
        .padding()
    }
}

#Preview {
    HomeView()
}

struct TopView: View {
    var title:String
    var details:String
    var body: some View {
        VStack(alignment:.leading, spacing: 16){
            Text(title).font(.title.bold())
            Text(details)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct InfoTF: View {
    var title: String
    @Binding var text:String
    @FocusState var isActive
    var body: some View {
        ZStack(alignment: .leading){
            TextField("", text: $text)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 55).focused($isActive)
                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 15))
            Text(title).padding(.leading).offset(y: (isActive || !text.isEmpty) ? -50 : 0)
                .animation(.spring, value: isActive)
                .foregroundStyle(isActive ? .white : .secondary)
                .onTapGesture {
                    isActive = true
                }
        }
    }
}

struct RememberStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack{
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .contentTransition(.symbolEffect)
                Text("Remember")
            }
        }
        .tint(.primary)
    }
}

struct SignButton: View {
    var title:String
    var action:() -> Void
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}
