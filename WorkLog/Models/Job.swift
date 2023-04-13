//
//  Job.swift
//  WorkLog
//
//  Created by Danny Wade on 13/04/2023.
//

import Foundation

struct Job: Identifiable {
    let id = UUID()
    var description: String
    var location: String
    var customerName: String
    var startDateTime: Date
    var endDateTime: Date
}
