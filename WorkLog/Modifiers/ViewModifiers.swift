//
//  ViewModifiers.swift
//  WorkLog
//
//  Created by Danny Wade on 11/04/2023.
//

import SwiftUI

struct DashboardComponentStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(10)
            .shadow(color: .gray, radius: 5, x: 0, y: 5)
            .padding(.bottom)
            
    }
}

struct DashboardTitleTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
            
    }
}

struct DashboardHeaderTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.semibold)
            .padding(.bottom, 5)
            
    }
}







    
