//
//  Event.swift
//  4006InfoDay2020
//
//  Created by 17214726 on 9/11/2020.
//

import Foundation

struct Event {
    let id: String
    let title: String
    let dept_id: String
    var saved: Bool
}

extension Event {
    
    static let sampleData: [Event] = [
        Event(id: "1", title: "Career Talks", dept_id: "coms", saved: false),
        Event(id: "2", title: "Guided Tour", dept_id: "coms", saved: false),
        Event(id: "3", title: "MindDrive Demo", dept_id: "comp", saved: false),
        Event(id: "4", title: "Project Demo", dept_id: "comp", saved: false)
    ]
}
