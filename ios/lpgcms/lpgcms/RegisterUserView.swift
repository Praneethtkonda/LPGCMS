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
                Text("Register yourself")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.top, 35)
                
                Image("landing_3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.bottom, 20)
                    .frame(width: 200, height: 200)

                
                TextField("Name", text: $name)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(4)
                    .padding(.bottom, 5)

                TextField("Phone number", text: $phonenumber)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(4)
                    .padding(.bottom, 5)

                TextField("Email Address", text: $email)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(4)
                    .padding(.bottom, 5)

                TextField("Floor number", text: $floornumber)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(4)
                    .padding(.bottom, 5)

                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(4)
                    .padding(.bottom, 15)
                
                Button("Register") {
                    // Logic to authenticate the user
                    TSSRegister(name: name, password: password, phonenumber: phonenumber, email: email, floornumber: floornumber)
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.appYellow)
                .cornerRadius(10)
            }
        })
//        .scrollClipDisabled(true)
        .navigationBarHidden(false)
    }
}

#Preview {
    RegisterUserView()
}
