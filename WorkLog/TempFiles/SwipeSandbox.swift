//
//  SwipeSandbox.swift
//  WorkLog
//
//  Created by Danny Wade on 15/04/2023.
//

import SwiftUI
import SwipeActions

struct SwipeSandbox: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(Color(red: 30/255, green: 139/255, blue: 195/255))
                    Text("Change Light Switch")
                }
                HStack {
                    Image(systemName: "clock.fill")
                        .foregroundColor(Color(red: 30/255, green: 139/255, blue: 195/255))
                    Text("10:00 - 12:30")
                }
            }
            
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 20) {
                HStack {
                    Text("Upminster")
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(Color(red: 4/255, green: 59/255, blue: 92/255))
                }
                HStack {
                    Text("Joe Bloggs")
                    Image(systemName: "person.circle.fill")
                        .foregroundColor(Color(red: 4/255, green: 59/255, blue: 92/255))
                }
            }
        }
        .fontWeight(.light)
        .padding()
        .background(Color.white)
        .modifier(DashboardComponentStyle())
    }
}

struct SwipeSandbox_Previews: PreviewProvider {
    static var previews: some View {
        SwipeSandbox()
    }
}
