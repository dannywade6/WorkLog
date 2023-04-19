//
//  ChartSandbox.swift
//  WorkLog
//
//  Created by Danny Wade on 18/04/2023.
//

import SwiftUI
import Charts

struct ChartSandbox: View {
    let workoutData = [
        (workoutType: "Walk", data: Workout.walkWorkout),
        (workoutType: "Run", data: Workout.runWorkout)
    ]
    
    var body: some View {
            VStack {
                Text("DevTechie.com")
                    .font(.largeTitle)
                    .foregroundColor(.primary)
                Chart {
                    ForEach(workoutData, id: \.workoutType) { element in
                        ForEach(element.data) {
                            BarMark(x: .value("Day", $0.day), y: .value("Workout(in minutes)", $0.minutes))
                                
                        }
                        .foregroundStyle(by: .value("Workout(type)", element.workoutType))
                        .position(by: .value("Workout(type)", element.workoutType))
                    }
                }
            }
            .padding()
        }
    }

struct ChartSandbox_Previews: PreviewProvider {
    static var previews: some View {
        ChartSandbox()
    }
}

struct Workout: Identifiable {
    let id = UUID()
    let day: String
    let minutes: Int
}

extension Workout {
    static let walkWorkout: [Workout] = [
        .init(day: "Mon", minutes: 23),
        .init(day: "Tue", minutes: 35),
        .init(day: "Wed", minutes: 55),
        .init(day: "Thu", minutes: 30),
        .init(day: "Fri", minutes: 15),
        .init(day: "Sat", minutes: 65),
        .init(day: "Sun", minutes: 81),
    ]
    
    static let runWorkout: [Workout] = [
        .init(day: "Mon", minutes: 16),
        .init(day: "Tue", minutes: 12),
        .init(day: "Wed", minutes: 55),
        .init(day: "Thu", minutes: 34),
        .init(day: "Fri", minutes: 22),
        .init(day: "Sat", minutes: 43),
        .init(day: "Sun", minutes: 90),
    ]
}
