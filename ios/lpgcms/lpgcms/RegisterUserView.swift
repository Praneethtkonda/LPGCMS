//
//  RegisterUserView.swift
//  lpgcms
//
//  Created by Praneeth TSS on 28/09/23.
//

import SwiftUI

struct RegisterUserView: View {
    @State private var name = ""
    @State private var password = ""
    @State private var phonenumber = ""
    @State private var email = ""
    @State private var floornumber = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showLoginView = false
    
    var body: some View {
        ScrollView (showsIndicators: false, content: {
            VStack {
                Image("LPgcms_logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .aspectRatio(contentMode: .fill)

                Text("Register yourself")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                TextField("Name", text: $name)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
//                    .border(.red, width: CGFloat(wrongUsername))
                TextField("Phone number", text: $phonenumber)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
//                    .border(.red, width: CGFloat(wrongUsername))
                TextField("Email Address", text: $email)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
//                    .border(.red, width: CGFloat(wrongUsername))
                TextField("Floor number", text: $floornumber)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
//                    .border(.red, width: CGFloat(wrongUsername))
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
//                    .border(.red, width: CGFloat(wrongPassword))
                
                Button("Register") {
                    // Logic to authenticate the user
                    TSSRegister(name: name, password: password, phonenumber: phonenumber, email: email, floornumber: floornumber)
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
            }
//            }
        })
//        .scrollClipDisabled(true)
        .navigationBarHidden(false)
    }
}

#Preview {
    RegisterUserView()
}
