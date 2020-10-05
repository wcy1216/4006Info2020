//
//  Building.swift
//  4006InfoDay2020
//
//  Created by 17214726 on 5/10/2020.
//

import Foundation
import MapKit

class Building: NSObject, MKAnnotation {
    
    let title: String?
    let zh_title: String
    let campus: String
    let coordinate: CLLocationCoordinate2D
    var subtitle: String? {
        return "\(zh_title), \(campus) campus"
    }
    
    init(
        title: String?,
        zh_title: String,
        campus: String,
        coordinate: CLLocationCoordinate2D
    ) {
        self.title = title
        self.zh_title = zh_title
        self.campus = campus
        self.coordinate = coordinate
    }
    
}

extension Building {
    
    static let campusBuildings: [Building] = [
        Building(title: "AC Hall",
                 zh_title: "大學會堂", campus: "Ho Sin Hang",
                 coordinate: CLLocationCoordinate2D(latitude: 22.341280, longitude: 114.179768)),
        Building(title: "Lam Woo International Conference Center",
                 zh_title: "林護國際會議中心", campus: "Shaw",
                 coordinate: CLLocationCoordinate2D(latitude: 22.337716, longitude: 114.182013)),
        Building(title: "Communication and Visual Arts Building",
                 zh_title: "傳理大樓", campus: "BU Road",
                 coordinate: CLLocationCoordinate2D(latitude: 22.334382, longitude: 114.182528))
    ]
    
}
