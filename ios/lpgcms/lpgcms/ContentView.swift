//
//  ContentView.swift
//  lpgcms
//
//  Created by Praneeth TSS on 28/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showLogin = false
    @State private var isLoggedin = false
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                Image("LPgcms_logo")
                    .resizable()
                    .font(.system(size: 400))
//                    .foregroundColor(.cyan)
                    .aspectRatio(contentMode: .fit)
                    .padding(.all, 30)
                
//                Text("Homes").bold()
//                    .font(.system(size: 40))
                Spacer()
//                Text("LPHomes 2021-2023")
                Text("© LPHomes 2024. All Rights Reserved.")
                .font(.footnote)
                .foregroundColor(.gray)
            }
            .navigationDestination(isPresented: $showLogin) {
//                RegisterUserView()
                LandingPageView()
            }
            .onAppear{
                Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                    withAnimation {
                        showLogin = true
//                        TSSRegister(name: "na2me", password: "password", phonenumber: "phonenumber", email: "email", floornumber: "9")
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
