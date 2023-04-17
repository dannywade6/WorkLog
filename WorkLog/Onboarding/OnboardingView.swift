//
//  OnboardingView.swift
//  WorkLog
//
//  Created by Danny Wade on 17/04/2023.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("brand.blue.one"), Color("brand.blue.two")], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("WorkLog")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Spacer()
                
                VStack {
                    Text("Enter Your Name:")
                    Text("Danny")
                    Divider()
                    Text("Select Your Currency:")
                    Text("£ GBP")
                }
                .frame(width: 300, height: 150)
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                
                Button {
                    print("Submit")
                } label: {
                    Text("Continue")
                        .foregroundColor(Color("brand.blue.two"))
                        .frame(width: 150, height: 50)
                        .background(Color.white)
                        .cornerRadius(15)
                        .padding(.top)
                }

                
                Spacer()
                
                
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
