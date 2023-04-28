//
//  EmptyStateView.swift
//  WorkLog
//
//  Created by Danny Wade on 28/04/2023.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 5) {
            Text("😔")
                .font(.system(size: 65))
                       
            Text("No Items!")
                .font(.title)
                .fontWeight(.bold)
            Text("You currently have no items added to show here.")
                .font(.subheadline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
        }
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView()
    }
}
