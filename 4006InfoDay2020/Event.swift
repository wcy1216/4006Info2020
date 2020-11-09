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

extension Event: Decodable {
    
//    static let sampleData: [Event] = [
//        Event(id: "1", title: "Career Talks", dept_id: "coms", saved: false),
//        Event(id: "2", title: "Guided Tour", dept_id: "coms", saved: false),
//        Event(id: "3", title: "MindDrive Demo", dept_id: "comp", saved: false),
//        Event(id: "4", title: "Project Demo", dept_id: "comp", saved: false)
//    ]
    
    public static let didSaveNotification = Notification.Name("didSave")

    
    static var sampleData: [Event] = {
        do {
            guard let rawEventData =
                try? Data(contentsOf: Bundle.main.bundleURL.appendingPathComponent("events.json")) else {
                    return []
            }
            return try JSONDecoder().decode([Event].self, from: rawEventData)
            
        } catch {
            print("events.json was not found or is not decodable.")
        }
        return []
    }()
    
//    private enum CodingKeys: String, CodingKey {
//        case id
//        case title
//        case dept_id = "dept id"
//        case saved
//    }

}
