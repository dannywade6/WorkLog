//
//  JobEmptyStateView.swift
//  WorkLog
//
//  Created by Danny Wade on 19/04/2023.
//

import SwiftUI

struct JobEmptyStateView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Currently there's no jobs to view")
                    .fontWeight(.semibold)
                    .frame(width: .infinity)
                    .padding(50)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                Spacer()
            }
            

                
        }
    }
}

struct JobEmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        JobEmptyStateView()
    }
}
