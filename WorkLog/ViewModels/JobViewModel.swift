//
//  JobViewModel.swift
//  WorkLog
//
//  Created by Danny Wade on 13/04/2023.
//

import Foundation

class JobViewModel: ObservableObject {
    @Published var jobs = [Job]()
    
    func addJob(description: String, location: String, customerName: String, startDateTime: Date, endDateTime: Date) {
        let job = Job(description: description, location: location, customerName: customerName, startDateTime: startDateTime, endDateTime: endDateTime)
        jobs.append(job)
    }
}
