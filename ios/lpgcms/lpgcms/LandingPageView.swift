//
//  LandingPageView.swift
//  lpgcms
//
//  Created by Praneeth TSS on 18/02/24.
//

import SwiftUI

struct LandingPageView: View {
    var body: some View {
        WalkthroughScreen()
    }
}

#Preview {
    LandingPageView()
}

struct WalkthroughScreen: View {
    @State private var isNextScreenActive = false
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack(spacing: 20) {
                    Spacer()

                    Image("landing")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    VStack {
                        
                        Text("Welcome to LP Homes")
                            .font(.title)
                            .fontWeight(.semibold)
                            .kerning(1.1)
                            .padding(.bottom, 5)
                        
                        Text("Register and connect")
                            .font(.title3)
                            .fontWeight(.light)
                            .fontWeight(.ultraLight)
//                            .kerning(1.4)
                            .padding(.bottom, 30)
                        
                        
                        Button("Join") {
                            // Button action
                            isNextScreenActive = true
                        }
                        .foregroundColor(.white)
                        // option-1
                        //.foregroundColor(.black)
                        //.background(Color.appGreen)
                        .frame(width: 300, height: 50)
                        .background(Color.appYellow)
                        .cornerRadius(10)
                        .navigationDestination(
                            isPresented: $isNextScreenActive) {
                                RegisterUserView()
                            }
                    }
                    .foregroundColor(.black)
                    .padding()
                    
                    Spacer() // Add space at the bottom
                    
                }
                .padding(.top, 20) // Adjust the top padding as needed
            }
            
        }
    }
}
