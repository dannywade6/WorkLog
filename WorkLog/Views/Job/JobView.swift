//
//  JobView.swift
//  WorkLog
//
//  Created by Danny Wade on 17/04/2023.
//

import SwiftUI

struct JobView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section("Today") {
                        DisclosureGroup("Change Door") {
                            FormRowView(firstItem: "Job Description", secondItem: "Change Roof")
                            
                        }
                        
                    }
                }
                
            }
            .navigationTitle("Jobs Dashboard")
        }
    }
    
}


struct JobView_Previews: PreviewProvider {
    static var previews: some View {
        JobView()
    }
}
